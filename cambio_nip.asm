
;=========================================================
; cambio_nip.asm
; ATM Simulator - MASM64
; Módulo de Cambio de NIP
;=========================================================

option casemap:none

EXTERN printf              : PROC
EXTERN scanf               : PROC
EXTERN strcmp              : PROC

;---------------------------------------------------------
; Variables globales
;---------------------------------------------------------

EXTERN NipActual           : BYTE

;---------------------------------------------------------
; Procedimientos externos
;---------------------------------------------------------

EXTERN GuardarNIP              : PROC
EXTERN RegistrarMovimiento     : PROC
EXTERN MostrarLinea            : PROC
EXTERN Pausa                   : PROC

PUBLIC CambiarNIP

.data

titulo db 10
         db "==========================================",10
         db "           CAMBIO DE NIP",10
         db "==========================================",10,0

msgNipActual db "Ingrese el NIP actual : ",0
msgNuevoNip db "Ingrese el nuevo NIP  : ",0
msgConfirmar db "Confirme el nuevo NIP : ",0

msgErrorActual db 10
               db "[ERROR] El NIP actual es incorrecto.",10,0

msgErrorConfirmacion db 10
                     db "[ERROR] Los NIP no coinciden.",10,0

msgErrorLongitud db 10
                 db "[ERROR] El NIP debe tener 4 digitos.",10,0

msgCorrecto db 10
            db "[OK] NIP actualizado correctamente.",10,0

fmtCadena db "%s",0

nipIngresado db 16 dup(0)
nuevoNip     db 16 dup(0)
confirmacion db 16 dup(0)

.code

;---------------------------------------------------------
; CambiarNIP
;---------------------------------------------------------

CambiarNIP PROC

    lea rcx,titulo
    call printf

    call MostrarLinea

    ;--------------------------------------
    ; Leer NIP actual
    ;--------------------------------------

    lea rcx,msgNipActual
    call printf

    lea rcx,fmtCadena
    lea rdx,nipIngresado
    call scanf

    ; Validar NIP actual

    lea rcx,nipIngresado
    lea rdx,NipActual
    call strcmp

    test eax,eax
    jne ErrorActual

    ;--------------------------------------
    ; Leer nuevo NIP
    ;--------------------------------------

    lea rcx,msgNuevoNip
    call printf

    lea rcx,fmtCadena
    lea rdx,nuevoNip
    call scanf

    ;--------------------------------------
    ; Leer confirmación
    ;--------------------------------------

    lea rcx,msgConfirmar
    call printf

    lea rcx,fmtCadena
    lea rdx,confirmacion
    call scanf

    ;--------------------------------------
    ; Comparar ambos NIP
    ;--------------------------------------

    lea rcx,nuevoNip
    lea rdx,confirmacion
    call strcmp

    test eax,eax
    jne ErrorConfirmacion

    ;--------------------------------------
    ; Validar longitud = 4
    ;--------------------------------------

    mov al,nuevoNip[4]
    cmp al,0
    jne ErrorLongitud

    ;--------------------------------------
    ; Copiar nuevo NIP
    ;--------------------------------------

    mov al,nuevoNip[0]
    mov NipActual[0],al

    mov al,nuevoNip[1]
    mov NipActual[1],al

    mov al,nuevoNip[2]
    mov NipActual[2],al

    mov al,nuevoNip[3]
    mov NipActual[3],al

    mov byte ptr NipActual[4],0

    ;--------------------------------------
    ; Guardar en usuarios.dat
    ;--------------------------------------

    call GuardarNIP

    ;--------------------------------------
    ; Registrar historial
    ;--------------------------------------

    call RegistrarMovimiento

    lea rcx,msgCorrecto
    call printf

    call MostrarLinea
    call Pausa

    ret

;---------------------------------------------------------

ErrorActual:

    lea rcx,msgErrorActual
    call printf

    call Pausa
    ret

;---------------------------------------------------------

ErrorConfirmacion:

    lea rcx,msgErrorConfirmacion
    call printf

    call Pausa
    ret

;---------------------------------------------------------

ErrorLongitud:

    lea rcx,msgErrorLongitud
    call printf

    call Pausa
    ret

CambiarNIP ENDP

END

