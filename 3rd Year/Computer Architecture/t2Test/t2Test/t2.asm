option casemap: none
includelib legacy_stdio_definitions.lib
extrn printf:near
.data

.data
public	g
g	QWORD	4


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


public		q
q:
	ret 0


public		qns
qns:
	ret 0


































end