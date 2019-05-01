; Definitions  -- references to 'UM' are to the User Manual.

; Timer Stuff -- UM, Table 173
IO0DIR	EQU	0xE0028008
IO0SET	EQU	0xE0028004
IO0CLR	EQU	0xE002800C
T0	equ	0xE0004000		; Timer 0 Base Address
T1	equ	0xE0008000

IR	equ	0			; Add this to a timer's base address to get actual register address
TCR	equ	4
MCR	equ	0x14
MR0	equ	0x18
T0PR equ 0xE000400C


TimerCommandReset	equ	2
TimerCommandRun	equ	1
TimerModeResetAndInterrupt	equ	3
TimerResetTimer0Interrupt	equ	1
TimerResetAllInterrupts	equ	0xFF

; VIC Stuff -- UM, Table 41
VIC	equ	0xFFFFF000		; VIC Base Address
IntEnable	equ	0x10
VectAddr	equ	0x30
VectAddr0	equ	0x100
VectCtrl0	equ	0x200

Timer0ChannelNumber	equ	4	; UM, Table 63
Timer0Mask	equ	1<<Timer0ChannelNumber	; UM, Table 63
IRQslot_en	equ	5		; UM, Table 58

	AREA	InitialisationAndMain, CODE, READONLY
	IMPORT	main

; (c) Mike Brady, 2014 -- 2019.

	EXPORT	start
start
; initialisation code

; Initialise the VIC
	ldr	r0,=VIC			; looking at you, VIC!

	ldr	r1,=irqhan
	str	r1,[r0,#VectAddr0] 	; associate our interrupt handler with Vectored Interrupt 0

	mov	r1,#Timer0ChannelNumber+(1<<IRQslot_en)
	str	r1,[r0,#VectCtrl0] 	; make Timer 0 interrupts the source of Vectored Interrupt 0

	mov	r1,#Timer0Mask
	str	r1,[r0,#IntEnable]	; enable Timer 0 interrupts to be recognised by the VIC

	mov	r1,#0
	str	r1,[r0,#VectAddr]   	; remove any pending interrupt (may not be needed)

; Initialise Timer 0
	ldr	r0,=T0			; looking at you, Timer 0!

	mov	r1,#TimerCommandReset
	str	r1,[r0,#TCR]

	mov	r1,#TimerResetAllInterrupts
	str	r1,[r0,#IR]

	ldr	r1,=18432	 ; 5 ms = 1/200 second
	str	r1,[r0,#MR0]
	
	ldr r0,=T0PR
	ldr r1,=3
	str r1,[r0];
	
	ldr r0,=T0
	
	

	mov	r1,#TimerModeResetAndInterrupt
	str	r1,[r0,#MCR]

	mov	r1,#TimerCommandRun
	str	r1,[r0,#TCR]
;test : push start address of Thread0 and Thread1 into memory
	
	

	
;from here, initialisation is finished, so it should be the main body of the main program

RGBLED
	;from here, initialisation is finished, so it should be the main body of the main program
	ldr	r1,=IO0DIR
	ldr	r2,=0x00060000	;select P0.21 P0.18 P0.17
	str	r2,[r1]		;make them outputs
	ldr	r1,=IO0SET
	str	r2,[r1]		;set them to turn the LEDs off
	ldr	r2,=IO0CLR
; r1 points to the SET register
; r2 points to the CLEAR register

;P0.17 RED  0x00020000
;P0.18 BLUE 0x00040000
;P0.21 GREEN 0x00200000 
	ldr	r5,=0x00080000	; end when the mask reaches this value
while	
	ldr	r3,=0x00020000	; start with P1.16.
for	
	str	r3,[r2]	   	; clear the bit -> turn on the LED
;delay for about a half second
	ldr	r4,=4000000
doWhile	
	subs r4,r4,#1
	bne	doWhile	

	str	r3,[r1]		;set the bit -> turn off the LED
	mov	r3,r3,lsl #1	;shift up to next bit. P1.16 -> P1.17 etc.
	cmp	r3,r5
	bne	for
	b	while
	


;main program execution will never drop below the statement above for RGB LED

practical1

IO1DIR	EQU	0xE0028018
IO1SET	EQU	0xE0028014
IO1CLR	EQU	0xE002801C

	ldr	r1,=IO1DIR
	ldr	r2,=0x000f0000	;select P1.19--P1.16
	str	r2,[r1]		;make them outputs
	ldr	r1,=IO1SET
	str	r2,[r1]		;set them to turn the LEDs off
	ldr	r2,=IO1CLR
; r1 points to the SET register
; r2 points to the CLEAR register

	ldr	r5,=0x00100000	; end when the mask reaches this value
wloop	ldr	r3,=0x00010000	; start with P1.16.
floop	str	r3,[r2]	   	; clear the bit -> turn on the LED

;delay for about a half second
	ldr	r4,=4000000
dloop	
	subs	r4,r4,#1
	bne	dloop
	str	r3,[r1]		;set the bit -> turn off the LED
	mov	r3,r3,lsl #1	;shift up to next bit. P1.16 -> P1.17 etc.
	cmp	r3,r5
	bne	floop
	b	wloop
	
stop	B	stop
	
	
	
	
	AREA	InterruptStuff, CODE, READONLY
irqhan	
	SUB LR,LR,#4
	STMFD sp!,{r0-r12,LR}	;the lr will be restored to the pc
	
	LDR R0,=switch;
	LDR R1,[R0];
	CMP R1,#0;   
	BNE thread1; 
	
	;;Next thread should be thread1
	LDR R1,=1;   	
	STR R1,[R0];
	;;Stroe anything about thread0 into memory;
	;LDR R0,=Thread0Address;
	;STR LR,[R0];
	
	
	;ADD R0,R0,#12;
	LDMFD SP!,{R2-R12}; ;;R12 hold the value of R10 ---> R2 ... R0
	
	LDR R0,=Thread0;
	STMIA R0!,{R2-R12};
	
	;ADD R0,R0,#12;
	LDMFD SP!,{R2-R4};  ;;R2 hold the value of R11,R3<-R12,R4<-LR
	STMIA R0!,{R2-R4};
	;;Load anything about thread1
	
	LDR R0,=Thread1
	ADD R0,R0,#12;
	LDMIA R0,{R2-R12}; 
	STMFD SP!,{R2-R12};
	SUB R0,R0,#12;
	LDMIA R0!,{R2-R4};
	STMFD SP!,{R2-R4};
	B	endOfSwitch
	
thread1
	;;Next thread should be thread0
	LDR R1,=0;   	
	STR R1,[R0];
	;;Stroe anything about thread0 into memory;
	;LDR R0,=Thread0Address;
	;STR LR,[R0];
	
	LDR R0,=Thread1;
	;ADD R0,R0,#12;
	LDMFD SP!,{R2-R12}; ;;R12 hold the value of R10 ---> R2 ... R0
	
	STMIA R0!,{R2-R12};
	;ADD R0,R0,#12;
	LDMFD SP!,{R2-R4};  ;;R2 hold the value of R11,R3<-R12,R4<-LR
	STMIA R0!,{R2-R4};
	;;Load anything about thread1
	
	LDR R0,=Thread0
	ADD R0,R0,#12;
	LDMIA R0,{R2-R12}; 
	STMFD SP!,{R2-R12};
	SUB R0,R0,#12;
	LDMIA R0!,{R2-R4};
	STMFD SP!,{R2-R4};

endOfSwitch

	ldr	r0,=T0
	mov	r1,#TimerResetTimer0Interrupt
	str	r1,[r0,#IR]	   	; remove MR0 interrupt request from timer

;here we stop the VIC from making the interrupt request to the CPU:
	ldr	r0,=VIC
	mov	r1,#0
	str	r1,[r0,#VectAddr]	; reset VIC
	
	mrs      r0,   spsr;
	mrs      R0,   cpsr;
	LDMFD sp!,{r0-r12,pc}^	; return from interrupt, restoring pc from lr


	
	;LDMFD sp!,{r0-r12,pc}	; return from interrupt, restoring pc from lr
				; and also restoring the CPSR
				
		AREA Output,DATA,READWRITE
Thread0 DCD 0,0,0,0,0,0,0,0,0,0,0,0,0,RGBLED; //R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,addressOfThread0
Thread1 DCD 0,0,0,0,0,0,0,0,0,0,0,0,0,practical1;//R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,addressOfThrea1
switch DCD 0; // 0->Thread0 1->Thread1
	END