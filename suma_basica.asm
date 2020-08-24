;Suma de dos numero estaticos no inresa por teclado

section .data
	resultado db "el Resultado es: ", 10
	len equ $-resultado

section .bss
	suma resb 1 

section .text
	global _start

_start:
	mov eax,6
	mov ebx,2
	add eax, ebx		;eax = eax + ebx
	;ajufatsr el valor ascii
	sub eax, '0'		;ajuste
	
	mov [suma], eax
	
	mov eax, 4
	mov ebx, 1
	add ecx, resultado
	mov edx, len
	int 80h
	
	;+++++imprimo suma
	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80h
	
	mov eax,1
	int 80h
	

