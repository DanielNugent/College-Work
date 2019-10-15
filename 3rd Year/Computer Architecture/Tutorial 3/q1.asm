add r0, #4, r9  ; global parameter g=4

min:                        ; int min(int a, int b, int c)

    add r0, r26, r1         ; r1=a=v
    sub r27, r1, r0, {C}    ; if(b<v) {
    jge continue            ;
    xor r0, r0, r0          ; nop
    add r0, r27, r1         ; v=b

continue:
    sub r28, r1, r0, {C}    ; if(c<v)
    jge minEnd              ;
    xor r0, r0, r0          ;
    add r0, r28, r1         ; v = c

minEnd:
    ret r25, 0
    xor r0, r0, r0

;////////////////////////////////////////////;

p:                          ; int p(int i, int j, int k, int l)

    add r0, r9, r10         ; g as param 1 for inner min
    add r0, r26, r11        ; i = param2
    add r0, r27, r12        ; j = param3
    callr r25, min          ; min(g, i, j)

    add r0, r1, r10         ; min(g, i, j) = param1
    add r0, r28, r11        ; k = param2
    add r0, r29, r12        ; l = param3
    callr r25, min          ; min((g, i, j), k, l)

    ret r25, 0
    xor r0, r0, r0

;////////////////////////////////////////////;

gcd:                        ; int gcd(int a, int b)

    sub r27, r0, r0, {C}
    je gcdEnd
    xor r0, r0, r0
    add r0, r1, r26

    add r0, r26, r10        ; mod param1 = a
    add r0, r27, r11        ; mod param2 = b
    callr r25, mod          ; mod(a, b)

recursive:
    add r0, r27, r10        ; gcd param1 = b
    add r0, r1, r11         ; gcd param2 = mod(a, b)
    callr r25, gcd          ; gcd(b, a % b)

gcdEnd:
    ret r25, 0
    xor r0, r0, r0