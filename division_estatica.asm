;David Pacheco
;Resta de dos numeros estaticos
section .data
        mensaje_presentacion db "La division de los dos numero es: ",10
        residuom db "El sobrante de los dos numero es: ",10
        len_msg_presentacion equ $-mensaje_presentacion
        len_residuo equ $-residuom
        new_line db " ",10
        len_new_line equ $-new_line
        
section .bss
        residuo resb 1
        cociente resb 1
                
section .text
        global _start

_start:

	mov al,8
	mov bh,2
	div bh		;eax = eax / ebx
	add al,'00'
	mov [cociente], al
	add ah, '0'
	mov [residuo], al

    mov [cociente], al

;****************Imprimir mensaje de presentacion********
    	mov eax,4		; tipo de sub-rutina, operación de escritura=>salida
	mov ebx,1		; tipo de estandar
	mov ecx,mensaje_presentacion		; 
	mov edx,len_msg_presentacion		; tamaño del mensaje
	int 80H	   		; interrupción de software para el sistema operativo linux

    ;******************imprime numero**********
    mov eax,4		; tipo de sub-rutina, para lecctura
	mov ebx,1		; tipo de estandar  de entrada
	mov ecx,resultado		; Lo almacena en numero, lo que captura en el teclado
	mov edx,1          ;es el numero de reserva, nnumero de caracteres
	int 80H	   		; interrupción de software para el sistema operativo linux


 ;******************imprime numero**********
    mov eax,4		; tipo de sub-rutina, para lecctura
	mov ebx,1		; tipo de estandar  de entrada
	mov ecx,cociente		; Lo almacena en numero, lo que captura en el teclado
	mov edx,1          ;es el numero de reserva, nnumero de caracteres
	int 80H	   		; interrupción de software para el sistema



    	mov eax, 1						 ; salida del programa, system exit, sys_exit
	int 80H	
