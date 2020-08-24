section .data
	asteriscos db '*'
	new_enter db 10, ''

section .bss
	result resb 1

section .text
	global _start
		
_start:
			mov ecx,9
			mov ebx,9
;imprimir enter evaluar cada fila
		for1:
			push rcx
			push rbx
			call imprimirEnter ;se reemplaza el valore de cx por enter y el valor de bx por 1
			pop rcx
			mov ebx, ecx
			push rbx

		for2:
			push rcx
			add ecx, '0'
			mov [result], ecx
			call imprimirAsterisco 
			pop rcx
			loop for2
			pop rbx
			pop rcx
			;dec ebx 
			loop for1

		imprimirEnter:
			mov eax, 4
			mov ebx, 1
			mov ecx, new_enter
			mov edx, 1
			int 80h
			ret
		
		imprimirAsterisco:
			mov eax, 4
			mov ebx, 1
			mov ecx, asteriscos
			mov edx, 1
			int 80h
			ret	

salir:
	mov eax, 1
	mov ecx, 0
	int 80h