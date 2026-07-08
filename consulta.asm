 id="d1w9ak"
;=========================================================
; consulta.asm
; ATM Simulator - MASM64
; Módulo de Consulta de Saldo
;=========================================================

option casemap:none

EXTERN printf              : PROC

;---------------------------------------------------------
; Variables globales
;---------------------------------------------------------

EXTERN NumeroCuentaActual  : BYTE
EXTERN NombreUsuario       : BYTE
EXTERN SaldoActual         : QWORD

;---------------------------------------------------------
; Procedimientos externos
;---------------------------------------------------------

EXTERN MostrarLinea        : PROC
EXTERN Pausa               : PROC

PUBLIC ConsultarSaldo

.data

tituloConsulta db 10
                db "==========================================",10
                db "         CONSULTA DE SALDO",10
                db "==========================================",10,0

msgCuenta db "Numero de cuenta : %s",10,0
msgNombre db "Titular          : %s",10,0
msgSaldo  db "Saldo disponible : $%llu",10,10,0

.code

;---------------------------------------------------------
; ConsultarSaldo
;---------------------------------------------------------

ConsultarSaldo PROC

    ; Mostrar título

    lea rcx,tituloConsulta
    call printf

    ; Línea separadora

    call MostrarLinea

    ; Mostrar número de cuenta

    lea rcx,msgCuenta
    lea rdx,NumeroCuentaActual
    call printf

    ; Mostrar nombre del usuario

    lea rcx,msgNombre
    lea rdx,NombreUsuario
    call printf

    ; Mostrar saldo disponible

    lea rcx,msgSaldo
    mov rdx,SaldoActual
    call printf

    ; Línea final

    call MostrarLinea

    ; Esperar al usuario

    call Pausa

    ret

ConsultarSaldo ENDP

END

