;David Pacheco Calle
%macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	mensaje db "a * b = c ",10
	len_mensaje equ $ - mensaje
	msjx db " x "
	lenx equ $-msjx
	igual db " = "
	len_igual equ $-igual
	sepa db "  "
	len_sepa equ $-sepa
	espacio db 10
	len_esp equ $-espacio
	
section .bss
	numero rest 2
	presentarN1 rest 2
	presentarN2 rest 2
	respuesta rest 2
	aux rest 2
	x rest 2

section .text
	global _start
	
_start:
principal:
	cmp ecx,9
	jz bucle
	inc ecx
	push rcx
	mov [numero], ecx
	jmp imp
	
imp:
	mov al, [numero]
	mov [presentarN1], al
	mov cl, [aux]
	mul cl
	
	mov [numero], al
	mov ah, [presentarN1]
	add ax, '00'
	add cx, '00'
	mov [presentarN1], ah
	mov [presentarN2], cl
	call imprimir_call
	;imprimir presentarN1, 1
	call imprimir_call1 ;;llamada a la
	;imprimir msj2, len2
	call imprimir_call2
	;imprimir presentarN2, 1
	call imprimir_call3
	;imprimir msj3, len3
	mov eax, 48
	add [numero], eax 
	imprimir numero, 2
	imprimir sepa, len_sepa
	pop rcx
	jmp principal
;;;;;;;;impresiones con call
imprimir_call:
	mov eax, 4
	mov ebx, 1
	mov ecx, presentarN1
	mov edx, 1
	int 80h
	ret 
imprimir_call1:
	mov eax, 4
	mov ebx, 1
	mov ecx, msjx
	mov edx, lenx
	int 80h
	ret
imprimir_call2:
	mov eax, 4
	mov ebx, 1
	mov ecx, presentarN2
	mov edx, 1
	int 80h
	ret
imprimir_call3:
	mov eax, 4
	mov ebx, 1
	mov ecx, igual
	mov edx, len_igual
	int 80h
	ret
;;;;;;;;; Fin impresiones con call
bucle: 
	imprimir espacio, len_esp
	mov ebx, [aux]
	inc ebx
	mov [aux], ebx
	mov ecx, 0
	cmp ebx, 6
	jb principal
salir:
	mov eax, 1
	mov ebx, 0
	int 80h