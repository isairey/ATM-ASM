
;=========================================================
; transferencia.asm
; ATM Simulator - MASM64
; Módulo de Transferencias
;=========================================================

option casemap:none

EXTERN printf              : PROC
EXTERN scanf               : PROC
EXTERN strcmp              : PROC

;---------------------------------------------------------
; Variables globales
;---------------------------------------------------------

EXTERN NumeroCuentaActual  : BYTE
EXTERN SaldoActual         : QWORD

;---------------------------------------------------------
; Procedimientos externos
;---------------------------------------------------------

EXTERN BuscarCuentaDestino     : PROC
EXTERN ActualizarTransferencia : PROC
EXTERN RegistrarMovimiento     : PROC

PUBLIC Transferencia

.data

tituloTransferencia db 10
                    db "====================================",10
                    db "         TRANSFERENCIA",10
                    db "====================================",10,0

msgSaldo db 10,"Saldo disponible: $%llu",10,0

msgCuenta db "Cuenta destino: ",0

msgMonto db "Monto a transferir: $",0

msgExito db 10
         db "[OK] Transferencia realizada correctamente.",10,0

msgNuevoSaldo db "Saldo restante: $%llu",10,10,0

msgErrorMonto db 10
              db "[ERROR] El monto debe ser mayor que cero.",10,0

msgSaldoInsuficiente db 10
                     db "[ERROR] Saldo insuficiente.",10,0

msgCuentaNoExiste db 10
                  db "[ERROR] La cuenta destino no existe.",10,0

msgMismaCuenta db 10
               db "[ERROR] No puede transferir a su propia cuenta.",10,0

fmtCadena db "%s",0
fmtNumero db "%llu",0

cuentaDestino db 32 dup(0)
montoTransferencia dq ?

.code

;---------------------------------------------------------
; Transferencia
;---------------------------------------------------------

Transferencia PROC

    ; Encabezado

    lea rcx,tituloTransferencia
    call printf

    lea rcx,msgSaldo
    mov rdx,SaldoActual
    call printf

    ;------------------------------------------
    ; Solicitar cuenta destino
    ;------------------------------------------

    lea rcx,msgCuenta
    call printf

    lea rcx,fmtCadena
    lea rdx,cuentaDestino
    call scanf

    ;------------------------------------------
    ; Validar que no sea la misma cuenta
    ;------------------------------------------

    lea rcx,NumeroCuentaActual
    lea rdx,cuentaDestino
    call strcmp

    test eax,eax
    jne Continuar

    lea rcx,msgMismaCuenta
    call printf
    ret

Continuar:

    ;------------------------------------------
    ; Buscar cuenta destino
    ;------------------------------------------

    lea rcx,cuentaDestino
    call BuscarCuentaDestino

    cmp rax,1
    je CuentaValida

    lea rcx,msgCuentaNoExiste
    call printf
    ret

CuentaValida:

    ;------------------------------------------
    ; Solicitar monto
    ;------------------------------------------

    lea rcx,msgMonto
    call printf

    lea rcx,fmtNumero
    lea rdx,montoTransferencia
    call scanf

    ;------------------------------------------
    ; Validar monto
    ;------------------------------------------

    mov rax,montoTransferencia

    cmp rax,0
    jle ErrorMonto

    ;------------------------------------------
    ; Validar saldo
    ;------------------------------------------

    mov rax,SaldoActual

    cmp rax,montoTransferencia
    jb ErrorSaldo

    ;------------------------------------------
    ; Descontar saldo
    ;------------------------------------------

    sub rax,montoTransferencia
    mov SaldoActual,rax

    ;------------------------------------------
    ; Actualizar ambas cuentas
    ;------------------------------------------

    call ActualizarTransferencia

    ;------------------------------------------
    ; Registrar movimiento
    ;------------------------------------------

    call RegistrarMovimiento

    ;------------------------------------------
    ; Mostrar resultado
    ;------------------------------------------

    lea rcx,msgExito
    call printf

    lea rcx,msgNuevoSaldo
    mov rdx,SaldoActual
    call printf

    ret

;---------------------------------------------------------

ErrorMonto:

    lea rcx,msgErrorMonto
    call printf
    ret

;---------------------------------------------------------

ErrorSaldo:

    lea rcx,msgSaldoInsuficiente
    call printf
    ret

Transferencia ENDP

END

