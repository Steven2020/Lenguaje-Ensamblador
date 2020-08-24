;Suma de do numeros estaticos, no se ingresara por teclado

section .data	
	mensaje1 db "Numero 1:"
	len_mensaje1 equ $-mensaje1
	
	mensaje2 db "Numero 2:"
	len_mensaje2 equ $-mensaje2
	
	resultado db "El resultado es:",10
	len_resultado equ $-resultado
	
	new_line db " ",10
	len_new_line equ $-new_line
	
section .bss
	suma resb 1
	a resb 1
	b resb 1
	
section .text
	global _start
	
_start:
;---------imprimir el valor del mensaje 1-----
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje1
	mov edx, len_mensaje1
	int 80h

;--------leer el primer valor
	mov eax, 3
	mov ebx, 2
	mov ecx, a
	mov edx, 2
	int 80h	
	
;---------imprimir el valor del mensaje 2-----
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje2
	mov edx, len_mensaje2
	int 80h

;--------leer el segundo valor
	mov eax, 3
	mov ebx, 2
	mov ecx, b
	mov edx, 2
	int 80h

;-----Traducir de cadena a entero
	mov ax, [a]
	mov bx, [b]
	sub ax, '0'	;valores convrtidos en decimal
	sub bx, '0'	;valores convrtidos en decimal
	;----
	add ax, bx	;suma
	;------------
	add ax, '0'      ;convertir a cadena
	
	mov [suma], ax
	
	mov eax,4
	mov ebx,1
	mov ecx,resultado
	mov edx,len_resultado
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_new_line
	int 80h
	
	mov eax, 1
	int 80h
	
	
	
