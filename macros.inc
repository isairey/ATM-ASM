 id="macroatm64"
;=========================================================
; macros.inc
; ATM Simulator - MASM64
; Biblioteca de Macros
;=========================================================

IFNDEF _MACROS_INC_
_MACROS_INC_ EQU 1

;---------------------------------------------------------
; Declaración de funciones externas
;---------------------------------------------------------

EXTERN printf  : PROC
EXTERN scanf   : PROC
EXTERN getchar : PROC
EXTERN system  : PROC

;---------------------------------------------------------
; PRINT
; Imprime una cadena
;---------------------------------------------------------

PRINT MACRO texto

    lea rcx,texto
    call printf

ENDM

;---------------------------------------------------------
; SCAN_STRING
; Lee una cadena
;---------------------------------------------------------

SCAN_STRING MACRO buffer, formato

    lea rcx,formato
    lea rdx,buffer
    call scanf

ENDM

;---------------------------------------------------------
; SCAN_INT
; Lee un entero
;---------------------------------------------------------

SCAN_INT MACRO variable, formato

    lea rcx,formato
    lea rdx,variable
    call scanf

ENDM

;---------------------------------------------------------
; CLEAR
; Limpia la consola
;---------------------------------------------------------

CLEAR MACRO

    LOCAL cmd

.data
cmd db "cls",0

.code

    lea rcx,cmd
    call system

ENDM

;---------------------------------------------------------
; PAUSE
; Espera ENTER
;---------------------------------------------------------

PAUSE MACRO

    call getchar
    call getchar

ENDM

;---------------------------------------------------------
; NEWLINE
; Salto de línea
;---------------------------------------------------------

NEWLINE MACRO

    LOCAL salto

.data
salto db 10,0

.code

    lea rcx,salto
    call printf

ENDM

;---------------------------------------------------------
; TITLE
; Imprime un título
;---------------------------------------------------------

TITLE MACRO titulo

    PRINT titulo
    NEWLINE

ENDM

;---------------------------------------------------------
; LINE
; Línea decorativa
;---------------------------------------------------------

LINE MACRO

LOCAL linea

.data

linea db "==========================================",10,0

.code

lea rcx,linea
call printf

ENDM

;---------------------------------------------------------
; ERROR_MSG
;---------------------------------------------------------

ERROR_MSG MACRO mensaje

    PRINT mensaje

ENDM

;---------------------------------------------------------
; SUCCESS_MSG
;---------------------------------------------------------

SUCCESS_MSG MACRO mensaje

    PRINT mensaje

ENDM

;---------------------------------------------------------
; WAIT_KEY
;---------------------------------------------------------

WAIT_KEY MACRO

    call getchar

ENDM

;---------------------------------------------------------
; EXIT_PROGRAM
;---------------------------------------------------------

EXIT_PROGRAM MACRO

    xor ecx,ecx
    call exit

ENDM

ENDIF

