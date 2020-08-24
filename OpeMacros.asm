;David Pacheco
;Operaciones Basicas

%macro imprimir 2
	mov eax,4
        mov ebx,1
        add ecx,$1
        add edx,%2
        int 80h
%endmacro

section .data
        resultado_suma db "La suma de los dos numero es: ",10
        resultado_resta db "La resta de los dos numero es: ",10
        resultado_mul db "La multiplicacion de los dos numero es: ",10
        resultado_div db "La division de los dos numero es: ",10
        resultado_residuo db "El residuo de los dos numero es: ",10
        len_msg_suma equ $-resultado_suma
        len_msg_resta equ $-resultado_resta
        len_msg_mul equ $-resultado_mul
        len_msg_div equ $-resultado_div
        len_msg_residuo equ $-resultado_residuo
section .bss
        suma resb 1
        resta resb 1
        multiplicacion resb 1
        cociente resb 1
        residuo resb 1
section .text
        global _start

_start:
	imprimir resultado_suma, len_msg_suma
    mov al,4
    mov bl,2
    add al,bl        ;eax=eax+ebx
    add al,'0'
    
    mov [suma], al
    imprimir suma, 1
 ;************************resta
 	imprimir resultado_resta, len_msg_resta    
    mov al,4
    mov bl,2
    sub al,bl        ;eax=eax+ebx
    add al,'0'
    
    mov [resta], al
    imprimir resta, 1
     ;************************mul
	imprimir resultado_mul, len_msg_mul    
    mov al,4
    mov bl,2
    mul bl        ;eax=eax+ebx
    add al,'0'
    
    mov [multiplicacion], al    
    imprimir multiplicacion, 1
     ;************************mdiv
	imprimir resultado_div, len_msg_div
    
    mov al,5
    mov bl,2
    div bl        ;eax=eax+ebx
    add al,'0'
    add ah,'0'
    
    mov [cociente], al
    mov [residuo], ah  
    
    imprimir div,1
    imprimir resultado_residuo, len_msg_residuo
    imprimir residuo,1
    ;**********************


    mov eax, 1						 ; salida del programa, system exit, sys_exit
	int 80H	
