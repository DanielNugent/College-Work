add r0, #4, r9  ; global parameter g=4

min:
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

p:
    ret r25, 0
