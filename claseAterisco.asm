%macro imprimir 1
    mov eax,4
	mov ebx,1
	mov ecx, %1
	mov edx, %1
	int 80h 
%endmacro

section .data
    msj db '*'
    new_line db 10, ''

section .text
    global _start
_start:
    mov ebx, 9  ;filas
    mov ecx, 9  ;columnas
    
principal:  ; esto es para las filas
    push ebx  ;
    cmp ebx, 0
    pop ebx
    jz salir
    jmp asterisco 
    

asterisco: ; esto para columnas
    dec ecx
    push ecx ;esto se resapaldar
    imprimir msj  ;el valor de ecx se reemplaza con '*'
    pop ecx ;para decrementarlo
    cmp ecx, 0
    jg asterisco ;para un valor menor el 1er sea menor que el 2do operando
    imprimir new_line
    pop ebx
    mov ecx, 9
    jmp principal

salir:
    mov eax, 1
    int 80h