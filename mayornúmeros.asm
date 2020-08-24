section .data
    msj1 db "Ingrese 5 números", 10
    len1 equ $ -msj1

    msj2 db "Número mayor es: ", 10
    len2 equ $-msj2

    arreglo db 0,0,0,0,0
    len_arreglo equ $-arreglo

section .bss
    numero resb 2

section .data
    global _start
_start:
    mov esi, arreglo  ;00000
    mov edi, 0

    ;-----mensaje 1
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, len1
    int 80h
    ;--------- lectura de datos arreglo

leer:
    mov eax, 3
    mov ebx, 6
    mov ecx, numero
    mov edx, 2
    int 80h

    mov al, [numero]
    sub al, '0'

    mov [esi], al ;indica 0 es numero 0

    inc edi
    inc esi ;le estamos fijando una cadena especifica el areglo

    cmp edi, len_arreglo
    jb leer
    
    mov ecx, 0;contador del cadena
    mov bl, 0

comparacion: ;--define si el valor es mayor
    mov al, [arreglo + ecx] ;ecx cuando primero entra es 0
    cmp al, bl ;si al es mayor que bl salta bl almacena numeros mayores
    jb contador 
    mov bl, al ;

contador:
    inc ecx ;ingresa
    cmp ecx, len_arreglo
    jb comparacion

imprimir:
    add bl, '0'
    mov [numero], bl

    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx, len2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov eax, numero
    mov edx, 1
    int 80h

salir:
    mov eax,1
    int 80h