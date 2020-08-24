section .data
	mensaje db 'ingrese unnnumero', 10
	len_mensaje equ $-mensaje   ; equ contar valores de una variable

section .bss
	numero resb 5;reserva 5 espacio
	
section .text
	global _start
_start:
	;+++++++imprime mensaje+++++++++++
	mov eax, 4 
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len_mensaje
	int 80h
	;++++++++++imprime mensaje+++++
	
	mov eax, 3 		;define el tipo de operacion
	mov ebx, 2  		;estandar de entrada
	mov ecx, numero 	;obtener para fijarlo en un temporal(captura en teclado)
	mov edx,5 		;debe coincidir con el valor .bss(numero de caracteres 
	int 80h			;iterrupcion de gnu linux
	
	
	;+++++++imprime mensaje presentacion+++++++++++
	mov eax, 4 
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len_mensaje
	int 80h
	
	;+++++++imprime numero+++++++++++
	mov eax, 4 
	mov ebx, 1
	mov ecx, numero
	mov edx, 5
	int 80h

	;+++++++++++salir del sistema
	mov eax,1
	int 80h
	
	
	
