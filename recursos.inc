
;=========================================================
; recursos.inc
; ATM Simulator - MASM64
; Recursos, constantes y variables globales
;=========================================================

IFNDEF RECURSOS_INC
RECURSOS_INC EQU 1

;=========================================================
; CONSTANTES
;=========================================================

MAX_USUARIOS           EQU 100
MAX_MOVIMIENTOS        EQU 1000

LONGITUD_CUENTA        EQU 8
LONGITUD_NIP           EQU 4
LONGITUD_NOMBRE        EQU 64
LONGITUD_DESCRIPCION   EQU 128

BUFFER_SIZE            EQU 512

MAX_INTENTOS_LOGIN     EQU 3

RETIRO_MULTIPLO        EQU 50

DEPOSITO_MINIMO        EQU 1

TRANSFERENCIA_MINIMA   EQU 1

;=========================================================
; ARCHIVOS
;=========================================================

ArchivoBanco       db "banco.dat",0

ArchivoHistorial   db "Historial.dat",0

ArchivoRespaldo    db "backup.dat",0

;=========================================================
; FORMATOS
;=========================================================

FmtCadena db "%s",0

FmtNumero db "%llu",0

FmtEntero db "%d",0

;=========================================================
; MENSAJES GENERALES
;=========================================================

TituloSistema db \
"==========================================",13,10,\
"      BANCO ASM - ATM SIMULATOR",13,10,\
"==========================================",13,10,0

Linea db \
"==========================================",13,10,0

MsgBienvenido db \
13,10,\
"Bienvenido al sistema bancario.",13,10,0

MsgError db \
13,10,\
"[ERROR]",13,10,0

MsgCorrecto db \
13,10,\
"[OK]",13,10,0

MsgSalir db \
13,10,\
"Gracias por utilizar ATM ASM.",13,10,0

MsgPausa db \
13,10,\
"Presione ENTER para continuar...",13,10,0

MsgOpcion db \
13,10,\
"Seleccione una opcion: ",0

MsgOpcionInvalida db \
13,10,\
"[ERROR] Opcion invalida.",13,10,0

MsgSaldoInsuficiente db \
13,10,\
"[ERROR] Saldo insuficiente.",13,10,0

MsgCuentaNoExiste db \
13,10,\
"[ERROR] La cuenta no existe.",13,10,0

MsgCuentaBloqueada db \
13,10,\
"[ERROR] Cuenta bloqueada.",13,10,0

MsgLoginCorrecto db \
13,10,\
"Inicio de sesion exitoso.",13,10,0

MsgLoginError db \
13,10,\
"Cuenta o NIP incorrectos.",13,10,0

;=========================================================
; VARIABLES GLOBALES
;=========================================================

NumeroCuentaActual db 16 dup(0)

NombreUsuario db 64 dup(0)

NipActual db 8 dup(0)

SaldoActual dq 0

EstadoCuenta db 16 dup(0)

TipoCuenta db 16 dup(0)

IntentosLogin dq 0

UsuarioAdministrador dq 0

;=========================================================
; BUFFER GENERAL
;=========================================================

BufferGeneral db BUFFER_SIZE dup(0)

BufferLectura db BUFFER_SIZE dup(0)

BufferEscritura db BUFFER_SIZE dup(0)

;=========================================================
; ESTRUCTURA USUARIO
;=========================================================

USUARIO STRUCT

Cuenta      db 16 dup(?)

Nombre      db 64 dup(?)

Nip         db 8 dup(?)

Saldo       dq ?

Estado      db 16 dup(?)

Tipo        db 16 dup(?)

USUARIO ENDS

;=========================================================
; ESTRUCTURA MOVIMIENTO
;=========================================================

MOVIMIENTO STRUCT

Cuenta          db 16 dup(?)

Fecha           db 16 dup(?)

Hora            db 16 dup(?)

Operacion       db 32 dup(?)

Monto           dq ?

Saldo           dq ?

Descripcion     db 128 dup(?)

MOVIMIENTO ENDS

;=========================================================
; CÓDIGOS DE OPERACIÓN
;=========================================================

OPERACION_LOGIN           EQU 1
OPERACION_CONSULTA        EQU 2
OPERACION_DEPOSITO        EQU 3
OPERACION_RETIRO          EQU 4
OPERACION_TRANSFERENCIA   EQU 5
OPERACION_CAMBIO_NIP      EQU 6

;=========================================================
; CÓDIGOS DE ERROR
;=========================================================

ERROR_NINGUNO             EQU 0
ERROR_LOGIN               EQU 1
ERROR_SALDO               EQU 2
ERROR_CUENTA              EQU 3
ERROR_NIP                 EQU 4
ERROR_ARCHIVO             EQU 5

ENDIF

