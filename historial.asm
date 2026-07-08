```asm
;=========================================================
; historial.asm
; ATM Simulator - MASM64
; Módulo de Historial de Movimientos
;=========================================================

option casemap:none

EXTERN printf              : PROC
EXTERN getchar             : PROC

; Procedimiento encargado de leer historial.dat
EXTERN LeerHistorial       : PROC

PUBLIC MostrarHistorial

.data

tituloHistorial db 10
                db "==========================================",10
                db "      HISTORIAL DE MOVIMIENTOS",10
                db "==========================================",10,0

linea db "------------------------------------------",10,0

sinMovimientos db 10
               db "No existen movimientos registrados.",10,0

presioneEnter db 10
              db "Presione ENTER para regresar...",10,0

.code

;---------------------------------------------------------
; MostrarHistorial
;---------------------------------------------------------

MostrarHistorial PROC

    ; Mostrar encabezado

    lea rcx,tituloHistorial
    call printf

    lea rcx,linea
    call printf

    ; Leer y mostrar historial
    ;
    ; LeerHistorial debe abrir historial.dat,
    ; filtrar los movimientos de la cuenta
    ; autenticada y mostrarlos.
    ;
    ; Devuelve:
    ; RAX = cantidad de registros encontrados

    call LeerHistorial

    cmp rax,0
    jne Continuar

    lea rcx,sinMovimientos
    call printf

Continuar:

    lea rcx,linea
    call printf

    lea rcx,presioneEnter
    call printf

    call getchar
    call getchar

    ret

MostrarHistorial ENDP

END
```
