 id="m1atm64"
;=========================================================
; main.asm
; ATM Simulator - MASM64
; Punto de entrada del programa
;=========================================================

option casemap:none

includelib msvcrt.lib

EXTERN printf          : PROC
EXTERN getchar         : PROC
EXTERN exit            : PROC

EXTERN Login           : PROC
EXTERN MenuPrincipal   : PROC
EXTERN LimpiarPantalla : PROC

PUBLIC main

.data

bienvenida db 10
            db "==================================================",10
            db "          BANCO ASM - ATM SIMULATOR",10
            db "==================================================",10
            db "        Proyecto desarrollado en MASM64",10
            db "==================================================",10,10,0

msgInicio db "Inicializando sistema...",10,0

msgAccesoDenegado db 10
                  db "========================================",10
                  db "Acceso denegado.",10
                  db "Demasiados intentos fallidos.",10
                  db "========================================",10,10,0

msgGracias db 10
            db "========================================",10
            db "Gracias por utilizar BANCO ASM.",10
            db "Hasta pronto.",10
            db "========================================",10,10,0

.code

;---------------------------------------------------------
; main
;---------------------------------------------------------

main PROC

    ;--------------------------------------
    ; Limpiar pantalla
    ;--------------------------------------

    call LimpiarPantalla

    ;--------------------------------------
    ; Mostrar bienvenida
    ;--------------------------------------

    lea rcx,bienvenida
    call printf

    lea rcx,msgInicio
    call printf

    ;--------------------------------------
    ; Login
    ;--------------------------------------

    call Login

    ; Login devuelve:
    ; RAX = 1 Correcto
    ; RAX = 0 Error

    cmp rax,1
    jne ErrorLogin

    ;--------------------------------------
    ; Abrir menú principal
    ;--------------------------------------

    call MenuPrincipal

    jmp Salir

;---------------------------------------------------------

ErrorLogin:

    lea rcx,msgAccesoDenegado
    call printf

;---------------------------------------------------------

Salir:

    lea rcx,msgGracias
    call printf

    xor ecx,ecx
    call exit

main ENDP

END

