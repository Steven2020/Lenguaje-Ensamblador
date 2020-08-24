segment .data
    arreglo db 3,2,2,1
    len_arreglo equ $-arreglo

segment .bss

segment -text
    global _start

_start
    mov esi, arreglo ; esi = fijar el tamaño del arreglo, posisicionar el arreglo en memoria
    mov edi, 0; edi = contener el indice del arreglo

imprimir:
    mov al, [esi]
    add al, '0'
    cmp edi, len_arreglo  ;cmp 3,4 => activa carry
                            ;cmp 4,3 => desactiva carry y desactic cero
                            ;cmp 3,3 => desactiva carry y zero se activa
    jb imprimir ; se ejecuta cuando la bandera del carry esta activa
    ;jmp imprimir

salir:
    mov eax, 1
    int 0x80


