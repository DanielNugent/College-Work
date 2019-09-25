.686                                ; create 32 bit code
.model flat, C                      ; 32 bit memory model
 option casemap:none                ; case sensitive

.data

public		g 

g	DWORD	4

.code

public		min			; min(int a, int b, int c)

min:
;	Function Entry
	push ebp			; save ebp
	mov ebp, esp		; ebp -> new stack frame

;	Function Body
	mov eax, [ebp + 8]	; eax = a = v
	cmp [ebp + 12], eax	; if(b < v) 
	jge continue		; {
	mov eax, [ebp + 12] ;	v = b; 
						; }
continue:
	cmp [ebp + 16], eax ; if(c < v)
	jge minEnd			; {
	mov eax, [ebp + 16]	;	v = c
						; }
;	Function Exit
minEnd:
	mov esp, ebp
	pop ebp
	ret 0
	

public		p			; p(int i, int j, int k, int l)

p:
;	Function Entry
	push ebp
	mov ebp, esp

;	Function Body
	push [ebp + 12]		; Pass params to min function by ; j
	push [ebp + 8]		; pushing on to stack. ; i
	push g				; right...left ; g

	call min			; min(g, i, j)

	push [ebp + 20]		; l
	push [ebp + 16]		; k
	push eax			; min(g, i, j)

	call min			; min(min(g, i, j), k, l)

;	Function Exit
	mov esp, ebp
	pop ebp
	ret 0


public		gcd			; gcd(int a, int b)

gcd:
;	Function Entry
	push ebp
	mov ebp, esp

;	Function Body
	mov eax, [ebp + 8]	; eax = a
	mov ecx, [ebp + 12]	; ecx = b
	cmp ecx, 0			; if (b == 0)
	je gcd_0			; 
	jmp recursive

recursive:
	xor edx, edx		; EDX:EAX pair for numerator
	cdq
	idiv ecx			; quotient = eax ; remainder = edx
	push edx			; a%b
	push ecx			; a
	call gcd			; gcd(a, a % b)
	add esp, 8

gcd_0:
	jmp gcdEnd

;	Funtion Exit
gcdEnd:
	mov esp, ebp
	pop ebp
	ret 0

end