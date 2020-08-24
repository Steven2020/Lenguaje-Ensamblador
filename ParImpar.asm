section .data
	par_msg db 'Numero par'
	len1 equ $ - par_msg
	impar_msg db 'NUmero Impar'
	len2 equ $ - impar_msg
section .text
	global_start

_start:
	mov ax, 8
	and ax, 1
	jz par
	jmp impar
	
par:
	mov eax, 4
	mov ebx, 1
	mov ecx, par_msg
	mov edx, len1
	int 0x80
	jmp salir
	
impar:
	mov eax, 4
	mov ebx, 1
	mov ecx, impar_msg
	mov edx, len2
	int 0x80
	jmp salir
	
salir:
	mov eax, 1
	int 0x80 
