section .data
    asterisco db '*'
    nueva_linea db 10,''

section .text
    global _start
_start:
    mov ecx, 8
    mov ebx, 1

l1:
    push rcx ; tiene 20
    ;push rbx; ; tiene 1
;///////////nueva linea
    mov eax,4
    mov ebx,1 
    mov ecx, nueva_linea
    mov edx, 1
    int 80h
    ;rescatar el ultimo valor ecx
    pop rcx ;tiene el ultimo valor
    push rcx
    ;inicio del for respaldar los datos loop
l2:
    push rcx ; ultimo valor guardado
    ;///////////asterisco
    mov eax,4
    mov ebx,1 
    mov ecx, asterisco
    mov edx, 1
    int 80h
    pop rcx
    loop l2

    pop rbx
    pop rcx
    inc rbx
    loop l1

    mov eax, 1
    int 80h