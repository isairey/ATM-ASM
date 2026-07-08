;=========================================================
; admin.asm
; ATM Simulator - MASM64
; Módulo de Administración
;=========================================================

option casemap:none

EXTERN printf:PROC
EXTERN scanf:PROC

EXTERN ListarUsuarios:PROC
EXTERN CrearUsuario:PROC
EXTERN EliminarUsuario:PROC
EXTERN ModificarSaldo:PROC
EXTERN MostrarHistorialGeneral:PROC
EXTERN RespaldarBaseDatos:PROC

PUBLIC MenuAdministrador

.data

tituloAdmin db 10
            db "====================================",10
            db "      PANEL DE ADMINISTRADOR",10
            db "====================================",10,0

menuAdmin db \
"1. Ver usuarios",10,\
"2. Crear cuenta",10,\
"3. Eliminar cuenta",10,\
"4. Modificar saldo",10,\
"5. Ver historial",10,\
"6. Respaldar base de datos",10,\
"7. Salir",10,\
"Seleccione una opcion: ",0

fmtInt db "%d",0

opcion dd ?

msgSalir db 10,"Regresando al menu principal...",10,0

.code

;---------------------------------------------------------
; MenuAdministrador
;---------------------------------------------------------

MenuAdministrador PROC

MenuPrincipal:

    lea rcx,tituloAdmin
    call printf

    lea rcx,menuAdmin
    call printf

    lea rcx,fmtInt
    lea rdx,opcion
    call scanf

    mov eax,opcion

    cmp eax,1
    je Opcion1

    cmp eax,2
    je Opcion2

    cmp eax,3
    je Opcion3

    cmp eax,4
    je Opcion4

    cmp eax,5
    je Opcion5

    cmp eax,6
    je Opcion6

    cmp eax,7
    je Salir

    jmp MenuPrincipal

;------------------------------------

Opcion1:

    call ListarUsuarios
    jmp MenuPrincipal

;------------------------------------

Opcion2:

    call CrearUsuario
    jmp MenuPrincipal

;------------------------------------

Opcion3:

    call EliminarUsuario
    jmp MenuPrincipal

;------------------------------------

Opcion4:

    call ModificarSaldo
    jmp MenuPrincipal

;------------------------------------

Opcion5:

    call MostrarHistorialGeneral
    jmp MenuPrincipal

;------------------------------------

Opcion6:

    call RespaldarBaseDatos
    jmp MenuPrincipal

;------------------------------------

Salir:

    lea rcx,msgSalir
    call printf

    ret

MenuAdministrador ENDP

END