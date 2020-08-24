;David Pacheco
;Multiplicacon de dos numeros estaticos
section .data
        mensaje_presentacion db "La multiplicacon de los dos numero es: ",10
        len_msg_presentacion equ $-mensaje_presentacion
        	
section .bss
        multiplicacion resb 1
                
section .text
        global _start

_start:

	mov eax,3
	mov ebx,2
	mul ebx				;eax = eax * evx
	add eax,'0'

    mov [multiplicacion], eax

;****************Imprimir mensaje de presentacion********
    	mov eax,4		; tipo de sub-rutina, operación de escritura=>salida
	mov ebx,1		; tipo de estandar
	mov ecx,mensaje_presentacion		; 
	mov edx,len_msg_presentacion		; tamaño del mensaje
	int 80H	   		; interrupción de software para el sistema operativo linux

    ;******************imprime numero**********
    mov eax,4		; tipo de sub-rutina, para lecctura
	mov ebx,1		; tipo de estandar  de entrada
	mov ecx,resta		; Lo almacena en numero, lo que captura en el teclado
	mov edx,1          ;es el numero de reserva, nnumero de caracteres
	int 80H	   		; interrupción de software para el sistema operativo linux


    	mov eax, 1						 ; salida del programa, system exit, sys_exit
	int 80H	
