%macro imprimir 1
    mov eax,4
	mov ebx,1
	mov ecx, %1
	mov edx, 1
	int 80h 
%endmacro

section .data
    msj db '*'
    new_line db 10, ''

section .text
    global _start
_start:
    mov bx, 9  ;filas
    mov cx, 9  ;columnas
    
principal:  ; esto es para las filas
    push bx  ;
    cmp bx, 0
    pop bx
    jz salir
    jmp asterisco 
    

asterisco: ; esto para columnas
    dec cx
    push cx ;esto se resapaldar
    imprimir msj  ;el valor de ecx se reemplaza con '*'
    pop cx ;para decrementarlo
    cmp cx, 0
    ;jg asterisco ;para un valor menor el 1er sea menor que el 2do operando
    imprimir new_line
    pop bx
    mov cx, 9
    jmp principal

salir:
    mov eax, 1
    int 80h