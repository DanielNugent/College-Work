	AREA	AsmTemplate, CODE, READONLY
	IMPORT	main

; sample program makes the 4 LEDs P1.16, P1.17, P1.18, P1.19 go on and off in sequence
; (c) Mike Brady, 2011 -- 2019.

	EXPORT	start
start

IO1DIR	EQU	0xE0028018
IO1SET	EQU	0xE0028014
IO1CLR	EQU	0xE002801C

	ldr	r1,=IO1DIR
	ldr	r2,=0x000f0000	;select P1.19--P1.16
	str	r2,[r1]		;make them outputs
	ldr	r1,=IO1SET
	str	r2,[r1]		;set them to turn the LEDs off
	ldr	r2,=IO1CLR	
begin	 
	ldr 	r0, =number
	ldr	r0, [r0]
	ldr	r8, =0;
 
	cmp	r0, #0
	bge	prnt_sign
	b 	twos_complement
prnt_sign
	ldr 	r3,= 0x000A0000
	str 	r3, [r2]
	b 	delay
	
twos_complement
	ldr 	r3, = 0x000B0000
	str 	r3,[r2]
	mvn	r0, r0
	add 	r0, r0, #1
	
delay
	ldr	r4,=8000000
loop	
	sub	r4, r4, #1
	cmp	r4, #0
	bge	loop
	str	r3,[r1]				;set the bit -> turn off the LED
	
convert
	ldr 	r5, = divisor_table	;loads in the address of the table
	ldr 	r6,=0
thank_u_next					;next divisor

	ldr	r8, [r5, r6, lsl #2]	;loads in address
	cmp	r0, r8
	bge 	get_digit
	add	r6, r6, #1
	b 	thank_u_next

get_digit
	ldr 	r7, =0			;count
division
	sub 	r0, r0, r8		;division	
	add 	r7, r7, #1		;count++
	cmp	r0, r8
	bge	division
		
display	
	mov 	r7,r7, lsl #16
	mov	r3, r7
	str 	r3, [r2]
delay2
	ldr 	r4,=8000000
loop2	
	sub	r4, r4, #1
	cmp	r4, #0
	bge 	loop2
	str	r3, [r1]	
	;b 	thank_u_next
thank_u_next2
	cmp	r0, #0
	bne	continue
	cmp 	r6, #9
	bgt 	begin
continue
	add	r6, r6, #1
	ldr	r8, [r5, r6, lsl #2]
	b	get_next_digit

get_next_digit
	mov 	r9, r0			;tmpVal = R0
	ldr	r7, =0
div
	subs	r0, r0, r8
	add 	r7, r7, #1
	cmp	r0, r8
	bge 	div
	bpl	display
	cmp 	r7, #1
	bne	display
	
display_zero
	ldr 	r3,=0x000f0000
	str 	r3,[r2]
	mov	r0, r9
	b	delay2
	
	
stop	B	stop

	AREA ROM, DATA, READONLY

number  DCD 	0x00000419
	
divisor_table	DCD 	1000000000, 100000000, 10000000, 1000000, 100000, 10000, 1000, 100, 10, 1



	END