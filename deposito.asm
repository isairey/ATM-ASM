```asm
;=========================================================
; deposito.asm
; ATM Simulator - MASM64
; Módulo de Depósitos
;=========================================================

option casemap:none

EXTERN printf              : PROC
EXTERN scanf               : PROC

; Variables globales (definidas en otro módulo)
EXTERN SaldoActual         : QWORD

; Procedimientos externos
EXTERN GuardarSaldo        : PROC
EXTERN RegistrarMovimiento : PROC

PUBLIC Depositar

.data

tituloDeposito db 10
                db "====================================",10
                db "          DEPOSITO BANCARIO",10
                db "====================================",10,0

msgSaldo db 10,"Saldo actual: $%llu",10,0

msgCantidad db "Cantidad a depositar: $",0

msgError db 10
         db "[ERROR] La cantidad debe ser mayor que cero.",10,0

msgCorrecto db 10
             db "[OK] Deposito realizado correctamente.",10,0

msgNuevoSaldo db "Nuevo saldo: $%llu",10,10,0

fmtInt db "%llu",0

cantidad dq ?

.code

;---------------------------------------------------------
; Depositar
;---------------------------------------------------------

Depositar PROC

    ; Mostrar titulo

    lea rcx,tituloDeposito
    call printf

    ; Mostrar saldo

    lea rcx,msgSaldo
    mov rdx,SaldoActual
    call printf

    ; Solicitar cantidad

    lea rcx,msgCantidad
    call printf

    lea rcx,fmtInt
    lea rdx,cantidad
    call scanf

    ; Validar

    mov rax,cantidad
    cmp rax,0
    jle ErrorCantidad

    ; saldo += cantidad

    mov rax,SaldoActual
    add rax,cantidad
    mov SaldoActual,rax

    ; Guardar cambios

    call GuardarSaldo

    ; Registrar movimiento

    call RegistrarMovimiento

    ; Mensaje

    lea rcx,msgCorrecto
    call printf

    lea rcx,msgNuevoSaldo
    mov rdx,SaldoActual
    call printf

    ret

;---------------------------------------------------------

ErrorCantidad:

    lea rcx,msgError
    call printf

    ret

Depositar ENDP

END
```
