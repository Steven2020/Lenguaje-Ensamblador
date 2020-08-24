section .data
        mensaje_presentacion db "La NOT del numero es: ",10
        len_msg_presentacion equ $-mensaje_presentacion
section .bss
        x resb 1
section .text
        global _start

_start:
;*********** test
    ;mov eax, 010b
    ;mov ebx, 111b
    ;test eax
    ;add eax,'0'
;*********** XOR
    mov eax, 010b
    mov ebx, 111b
    xor eax, ebx
    add eax,'0'
;010
;111
;--- xor
;101
;*********** AND
    ;mov eax, 010b
    ;mov ebx, 111b
    ;and eax, ebx
    ;add eax,'0'
;010
;111
;--- AND
;010

    mov [x], eax

    	mov eax,4		; tipo de sub-rutina, operación de escritura=>salida
	mov ebx,1		; tipo de estandar
	mov ecx,mensaje_presentacion		; 
	mov edx,len_msg_presentacion		; tamaño del mensaje
	int 80H	   		; interrupción de software para el sistema operativo linux

    ;************************************imprime numero********************************************
    	mov eax,4		; tipo de sub-rutina, para lecctura
	mov ebx,1		; tipo de estandar  de entrada
	mov ecx,x		; Lo almacena en numero, lo que captura en el teclado
	mov edx,1          	;es el numero de reserva, nnumero de caracteres
	int 80H	   		; interrupción de software para el sistema operativo linux

    mov eax, 1						 ; salida del programa, system exit, sys_exit
	int 80H	
