	AREA	AsmTemplate, CODE, READONLY
	IMPORT	main

; sample program makes the 4 LEDs P1.16, P1.17, P1.18, P1.19 go on and off in sequence
; (c) Mike Brady, 2011 -- 2019.

	EXPORT	start
start

IO1DIR	EQU	0xE0028018
IO1SET	EQU	0xE0028014
IO1CLR	EQU	0xE002801C
IO1DIR1	EQU	0xE0028010

	LDR	R1,=IO1DIR
	LDR	R2,=0x000F0000	;select P1.19--P1.16
	LDR	R9,=0x00F00000	;select P1.20--P1.23
	STR	R2,[R1]		;make them outputs
	LDR	R1,=IO1SET
	STR	R2,[R1]		;set them to turn the LEDs off
	LDR	R3,=IO1CLR
	STR R2,[R3]     ;set them to turn the LEDs on
	BL	delay
	STR	R2,[R1]		;set them to turn the LEDs off
; r1 points to the SET register
; r3 points to the CLEAR register
cleareverything
	LDR R4,=0		; state=idle
	LDR R5,=0		; input = idle
	LDR R6,=0		; current = 0
	LDR	R7,=0		; sum = 0

mainloop				; while(true) {
	BL  readPress		; while(readPress()==noPress)
notPressed				; {
	CMP	R5,#0			;	// wait
	BEQ	mainloop		; }
isPressed
	CMP R5,#20			; if (input==n+)
	BNE elseifnminus	; {
	MOV R4,#1			;	state = n+ ;
	ADD	R6,R6,#1		;	current++ ;
	B	checkdisplay	; }
elseifnminus
	CMP	R5,#21			; else if (input==n-)
	BNE	elseifplus1		; {
	MOV	R4,#2			;	state = n- ;
	SUB	R6,R6,#1		;	current-- ;
	B	checkdisplay	; }
elseifplus1
	CMP	R5,#22			; else if ((input==+)
	BNE	elseifminus1	; 				&&
	CMP	R4,#1			;					((state==n+)
	BEQ displayplus		;								|| 
	CMP R4,#2			;									(state==n-)))
	BEQ	displayplus
	B	elseifplus2
displayplus				; { 
	MOV	R4,#3			;	state = + ;
	ADD	R7,R6,R7		;	sum += current ;
	MOV	R6,#0			;	current=0 ;
	B	checkdisplay	; }
elseifminus1
	CMP	R5,#23			; else if ((input==-)
	BNE	elseifC			; 					&&
	CMP	R4,#1			;					((state==n+) 
	BEQ displayminus	;								||
	CMP R4,#2		
	BEQ	displayminus	;									(state==n-)))
	B	elseifminus2
displayminus			; {
	MOV	R4,#4			;	state = - ;
	SUB	R7,R7,R6		;	sum -= current ;   
	MOV	R6,#0			;	current=0 ;
	B	checkdisplay	; }
elseifplus2				; else if (input==+)
	MOV	R4,#3	
	B	checkdisplay	;	state = + ;              
elseifminus2			; else if (input==-)
	MOV	R4,#4			;	state = - ;              
	B	checkdisplay
elseifC					;
	CMP	R5,#-22			; else if (input == C)
	BNE	elseifCE		; {
	MOV	R6,R7			;	current = sum ;
	MOV	R7,#0			;	sum = 0 ;
	MOV	R4,#1			;	state = n+
	B	checkdisplay	; }
elseifCE				; else if (input == CE)
	BL	displaynothing
	B	cleareverything	;	branch to clear everything ;
	
checkdisplay			; if ((state==+) 
	CMP	R4,#3			;				||
	BEQ	displaynum		;					(state == -))
	CMP	R4,#4			; {
	BNE	emptydisplay	;		display on LED()
displaynum					;
	BL	display			; }
	B	mainloop		; 
emptydisplay
	BL	displaynothing
	B	mainloop
	
	
	
stop	B	stop


; delay subroutine
delay
	STMFD	SP!,{R0-R12,LR}
	LDR		R4,=8000000
dloop
	SUBS	R4,R4,#1
	BNE		dloop
	LDMFD	SP!, {R0-R12,PC}
	
; longPressDelay subroutine
longPressDelay
	STMFD	SP!,{R0-R12,LR}
	LDR		R4,=16000000
dloop1
	SUBS	R4,R4,#1
	BNE		dloop1
	LDMFD	SP!, {R0-R12,PC}


; readPress subroutine
; Parameters :
;
; Return : R5 = input
readPress
	STMFD	SP!,{R0-R4, R6-R12,LR}
	LDR	R1,=IO1DIR1
	LDR R2, [R1]			; pins = interface.pins
	LDR	R3,=0x00F00000		; select P1.20--P1.23
	AND R2, R2, R3			; pins = pins && selectedPins
	MOV R2, R2, LSR #20		; pins >> 20
	
	CMP R2, #0x0000000F		; if(pins==1111)
	BNE label1				; {
	MOV R5, #0				;	return 0; (through R5)
	B   returnPressed
label1						; }
	CMP R2, #0x0000000E		; if(pins=1110)
	BNE label2				; {
	MOV R5, #20				;	return 20;
	B	returnPressed		;
label2						; }	
	CMP R2, #0x0000000D		; if(pins=1101)
	BNE label3				; {
	MOV R5, #21				;	return 21;
	B	returnPressed		;
label3						; }	
	CMP R2, #0x0000000B		; if(pins=1011)
	BNE label4				; {
	BL	longPressDelay		;	wait(pressTime)
	LDR R2, [R1]			; 	pins = interface.pins
	LDR	R3,=0x00F00000		; 	select P1.20--P1.23
	AND R2, R2, R3			; 	pins = pins && selectedPins
	MOV R2, R2, LSR #20		; 	pins >> 20
	CMP R2, #0x0000000B		;	if(pins=1011)
	BNE notHeld1			;	{
	MOV	R5, #-22			;		return 22;
	B   returnPressed
notHeld1					;	}
	MOV R5, #22			;	return 22;
	B	returnPressed		;
label4						; }	
							; else{
	BL	longPressDelay		;	wait(pressTime)
	LDR R2, [R1]			; 	pins = interface.pins
	LDR	R3,=0x00F00000		; 	select P1.20--P1.23
	AND R2, R2, R3			; 	pins = pins && selectedPins
	MOV R2, R2, LSR #20		; 	pins >> 20
	CMP R2, #0x00000007		;	if(pins=0111)
	BNE notHeld2			;	{
	MOV	R5, #-23			;		return 23;
	B   returnPressed
notHeld2					;	}
	MOV R5, #-23			;	return -23;
	B	returnPressed		;
							; }	
	
returnPressed
	LDMFD	SP!, {R0-R4, R6-R12,PC}

; display subroutine
; shift left 16bits 
; and with CLR
; delay
; Parameter : R7 - sum
display
	STMFD	SP!,{R0-R12,LR}
	MOV		R0, R7
	MOV		R0, R0, LSL#16
	LDR		R3,=0x00080000		; bit 19
	AND		R3,	R3, R0
	MOV		R3, R3, LSR #3
	LDR		R4,=0x00040000		; bit 18
	AND		R4, R4, R0
	MOV		R4, R4, LSR #1
	LDR		R5,=0x00020000		; bit 17
	AND		R5, R5, R0
	MOV		R5, R5, LSL #1
	LDR		R6,=0x00010000		; bit 16
	AND		R6, R6, R0
	MOV		R6, R6, LSL #3
	LDR		R8,=0				; final sum
	ORR		R8, R8, R3
	ORR		R8, R8, R4
	ORR		R8, R8, R5
	ORR		R8, R8, R6
	LDR		R2,=IO1CLR
	STR		R8,[R2]
	BL		delay
	
	LDMFD	SP!, {R0-R12,PC}



; displaynothing subroutine
displaynothing
	STMFD	SP!,{R0-R12,LR}
	LDR		R1,=IO1SET
	LDR		R0, =0x000F0000
	STR		R0,[R1]
	BL		delay
	
	LDMFD	SP!, {R0-R12,PC}

	
	
	


	END