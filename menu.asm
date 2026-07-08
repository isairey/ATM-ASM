
;=========================================================
; menu.asm
; ATM Simulator - MASM64
; Menú Principal
;=========================================================

option casemap:none

EXTERN printf              : PROC
EXTERN scanf               : PROC

;==========================
; Módulos
;==========================

EXTERN ConsultarSaldo      : PROC
EXTERN Depositar           : PROC
EXTERN Retirar             : PROC
EXTERN Transferencia       : PROC
EXTERN MostrarHistorial    : PROC
EXTERN CambiarNIP          : PROC
EXTERN MenuAdministrador   : PROC

EXTERN LimpiarPantalla     : PROC

PUBLIC MenuPrincipal

.data

titulo db 10
         db "==============================================",10
         db "        BANCO ASM - CAJERO AUTOMATICO",10
         db "==============================================",10,0

menu db \
10,\
"1. Consultar saldo",10,\
"2. Depositar dinero",10,\
"3. Retirar dinero",10,\
"4. Transferencia bancaria",10,\
"5. Historial de movimientos",10,\
"6. Cambiar NIP",10,\
"7. Panel de administrador",10,\
"8. Cerrar sesion",10,10,\
"Seleccione una opcion: ",0

fmtInt db "%d",0

opcion dd ?

msgError db 10
          db "[ERROR] Opcion invalida.",10,10,0

msgSalir db 10
          db "Cerrando sesion...",10,10,0

.code

;---------------------------------------------------------
; MenuPrincipal
;---------------------------------------------------------

MenuPrincipal PROC

InicioMenu:

    call LimpiarPantalla

    lea rcx,titulo
    call printf

    lea rcx,menu
    call printf

    lea rcx,fmtInt
    lea rdx,opcion
    call scanf

    mov eax,opcion

    cmp eax,1
    je Consulta

    cmp eax,2
    je Deposito

    cmp eax,3
    je Retiro

    cmp eax,4
    je Transferir

    cmp eax,5
    je Historial

    cmp eax,6
    je CambioNIP

    cmp eax,7
    je Administrador

    cmp eax,8
    je Salir

    lea rcx,msgError
    call printf

    jmp InicioMenu

;=========================================================

Consulta:

    call ConsultarSaldo
    jmp InicioMenu

;=========================================================

Deposito:

    call Depositar
    jmp InicioMenu

;=========================================================

Retiro:

    call Retirar
    jmp InicioMenu

;=========================================================

Transferir:

    call Transferencia
    jmp InicioMenu

;=========================================================

Historial:

    call MostrarHistorial
    jmp InicioMenu

;=========================================================

CambioNIP:

    call CambiarNIP
    jmp InicioMenu

;=========================================================

Administrador:

    call MenuAdministrador
    jmp InicioMenu

;=========================================================

Salir:

    lea rcx,msgSalir
    call printf

    ret

MenuPrincipal ENDP

END

