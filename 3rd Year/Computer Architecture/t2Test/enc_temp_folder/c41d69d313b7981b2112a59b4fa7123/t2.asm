option casemap: none
includelib legacy_stdio_definitions.lib
extrn printf:near
.data

.data
public	g
g	QWORD	4
fqns	db	'a = %I64d b = %I64d c = %I64d d = %I64d e = %I64d sum = %I64d', 0AH, 00H
qnss	db  'qns', 0AH, 00H


.code

public		min		;  min(_int64 a, _int64 b, _int64 c)

min:
	mov rax, rcx	;eax = a = v
	cmp rdx, rax	; if(b < v)	
	jge continue	; {
	mov rax, rdx	; v = b; }
		
continue:
	cmp r8, rax		; if (c < v) 
	jge minEnd		; {
	mov rax, r8		; v = c;

minEnd:
	ret 0


public		p		; p(_int64 i, _int64 j, _int64 , k, _int64 l)

p:
	sub rsp, 32			; allocate 32 bytes of shadow space
	
	mov [rsp+56], r8	; save k in shadow space for later

	mov r8, rdx			; r8 = j
	mov rdx, rcx		; rdx = i
	mov rcx, g			; rcx = g

	call min			; min(g, i, j)

	mov rcx, rax		; rcx = result from min(g, i, j)
	mov rdx, [rsp+56]	; r8 = k (from shadow space)
	mov r8, r9			; r9 = l

	call min			; min(min(g, i, j), k, l)

	add rsp, 32			; de-allocate shadow space
	ret 0


public		gcd		;  gcd(_int64 a, _int64 b)

gcd:
	sub rsp, 32		; allocate shadow space

	mov rax, rcx	; rax = a
	mov rcx, rdx	; rcx = b

	cmp ecx, 0		; if(b == 0)
	je gcdEnd		; { return a; }

recursive:			; rdx:rax pair
	xor rdx, rdx	;	
	cqo				;
	idiv rcx		; quotient = rax ; remainder = rdx
	call gcd		; gcd(a, a %b)

gcdEnd:
	add rsp, 32		; de-allocate shadow space
	ret 0

public		q		;  q(_int64 a, _int64 b, _int64 c, _int64 d, _int64 e)
q:          
	sub rsp, 56						; 7 params = 7 * 8 = 56
           		
    mov rax, rcx					; a
    add rax, rdx					; sum += b
    add rax, r8						; sum += c
    add rax, r9						; sum += d
    add rax, [rsp+96]				; sum += e
			
	mov [rsp+64], rax				; preserve sum in shadow space 
    mov [rsp+48],rax				; sum
	mov rax, [rsp+96]				; rax = e
	mov [rsp+40],rax				; e
	mov [rsp+32],r9					; d
            
    mov r9, r8						; c
    mov r8, rdx						; b
    mov rdx, rcx					; a
    lea rcx, fqns					; fqns format string

    call printf						;
	mov rax, [rsp+64]				; sum from stack
	add rsp, 56						; de-allocate shadow space
    ret	0							; 


public		qns
qns:
	sub rsp, 32
	lea rcx, qnss
	call printf
	mov rax, 0
	add rsp, 32
	ret 0



end