
;=========================================================
; util.asm
; ATM Simulator - MASM64
; Biblioteca de utilidades
;=========================================================

option casemap:none

EXTERN printf  : PROC
EXTERN scanf   : PROC
EXTERN getchar : PROC
EXTERN system  : PROC

PUBLIC LimpiarPantalla
PUBLIC Pausa
PUBLIC MostrarLinea
PUBLIC MostrarTitulo
PUBLIC LeerEntero
PUBLIC LeerCadena

.data

cmdCLS db "cls",0

linea db "==========================================",10,0

msgPausa db 10
          db "Presione ENTER para continuar...",10,0

fmtInt db "%llu",0
fmtStr db "%s",0

.code

;---------------------------------------------------------
; LimpiarPantalla
;---------------------------------------------------------

LimpiarPantalla PROC

    lea rcx,cmdCLS
    call system

    ret

LimpiarPantalla ENDP

;---------------------------------------------------------
; Pausa
;---------------------------------------------------------

Pausa PROC

    lea rcx,msgPausa
    call printf

    call getchar
    call getchar

    ret

Pausa ENDP

;---------------------------------------------------------
; MostrarLinea
;---------------------------------------------------------

MostrarLinea PROC

    lea rcx,linea
    call printf

    ret

MostrarLinea ENDP

;---------------------------------------------------------
; MostrarTitulo
; RCX = dirección del texto
;---------------------------------------------------------

MostrarTitulo PROC

    push rcx

    lea rcx,linea
    call printf

    pop rcx
    call printf

    lea rcx,linea
    call printf

    ret

MostrarTitulo ENDP

;---------------------------------------------------------
; LeerEntero
;
; RCX = dirección donde guardar el número
;---------------------------------------------------------

LeerEntero PROC

    mov rdx,rcx
    lea rcx,fmtInt

    call scanf

    ret

LeerEntero ENDP

;---------------------------------------------------------
; LeerCadena
;
; RCX = dirección del buffer
;---------------------------------------------------------

LeerCadena PROC

    mov rdx,rcx
    lea rcx,fmtStr

    call scanf

    ret

LeerCadena ENDP

END

