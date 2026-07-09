
;=========================================================
; retiro.asm
; ATM Simulator - MASM64
; Módulo de Retiros
;=========================================================

option casemap:none

EXTERN printf              : PROC
EXTERN scanf               : PROC

;------------------------------------------
; Variables globales
;------------------------------------------

EXTERN SaldoActual         : QWORD

;------------------------------------------
; Procedimientos externos
;------------------------------------------

EXTERN GuardarSaldo        : PROC
EXTERN RegistrarMovimiento : PROC

PUBLIC Retirar

.data

tituloRetiro db 10
             db "====================================",10
             db "            RETIRO ATM",10
             db "====================================",10,0

msgSaldo db 10,"Saldo disponible: $%llu",10,0

msgCantidad db "Cantidad a retirar: $",0

msgExito db 10
         db "[OK] Retiro realizado correctamente.",10,0

msgNuevoSaldo db "Saldo restante: $%llu",10,10,0

msgErrorCantidad db 10
                  db "[ERROR] Cantidad invalida.",10,0

msgSaldoInsuficiente db 10
                     db "[ERROR] Saldo insuficiente.",10,0

msgMultiplo db 10
            db "[ERROR] Solo se permiten retiros en multiplos de 50.",10,0

fmtInt db "%llu",0

cantidad dq ?

.code

;---------------------------------------------------------
; Retirar
;---------------------------------------------------------

Retirar PROC

    ;--------------------------------------
    ; Mostrar encabezado
    ;--------------------------------------

    lea rcx,tituloRetiro
    call printf

    lea rcx,msgSaldo
    mov rdx,SaldoActual
    call printf

    ;--------------------------------------
    ; Solicitar cantidad
    ;--------------------------------------

    lea rcx,msgCantidad
    call printf

    lea rcx,fmtInt
    lea rdx,cantidad
    call scanf

    ;--------------------------------------
    ; Validar cantidad > 0
    ;--------------------------------------

    mov rax,cantidad
    cmp rax,0
    jle CantidadIncorrecta

    ;--------------------------------------
    ; Validar múltiplo de 50
    ;--------------------------------------

    xor rdx,rdx
    mov rcx,50
    div rcx

    cmp rdx,0
    jne ErrorMultiplo

    ;--------------------------------------
    ; Validar saldo
    ;--------------------------------------

    mov rax,SaldoActual
    cmp rax,cantidad
    jb SaldoInsuficiente

    ;--------------------------------------
    ; saldo -= cantidad
    ;--------------------------------------

    sub rax,cantidad
    mov SaldoActual,rax

    ;--------------------------------------
    ; Guardar cambios
    ;--------------------------------------

    call GuardarSaldo

    ;--------------------------------------
    ; Registrar movimiento
    ;--------------------------------------

    call RegistrarMovimiento

    ;--------------------------------------
    ; Mostrar resultado
    ;--------------------------------------

    lea rcx,msgExito
    call printf

    lea rcx,msgNuevoSaldo
    mov rdx,SaldoActual
    call printf

    ret

;---------------------------------------------------------

CantidadIncorrecta:

    lea rcx,msgErrorCantidad
    call printf
    ret

;---------------------------------------------------------

SaldoInsuficiente:

    lea rcx,msgSaldoInsuficiente
    call printf
    ret

;---------------------------------------------------------

ErrorMultiplo:

    lea rcx,msgMultiplo
    call printf
    ret

Retirar ENDP

END

