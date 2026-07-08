; =====================================================
; login.asm
; ATM-ASM 64 Bits
; Módulo de autenticación
; MASM64
; =====================================================

option casemap:none

EXTERN printf : PROC
EXTERN scanf  : PROC
EXTERN strcmp : PROC

.data

tituloLogin db 10,10,"====================================",10,0
db "         ATM - BANCO ASM",10,0
db "====================================",10,0

msgCuenta db 10,"Numero de cuenta: ",0
msgNip    db "NIP: ",0

msgError  db 10,"[ERROR] Cuenta o NIP incorrectos",10,0
msgOk     db 10,"[OK] Acceso concedido",10,0

fmtStr db "%s",0

; Usuario de prueba
cuentaValida db "12345678",0
nipValido    db "1234",0

cuentaIngresada db 32 dup(0)
nipIngresado    db 32 dup(0)

intentos dq 0

.code

; -----------------------------------------------------
; Login
; Retorna:
; RAX = 1 -> Correcto
; RAX = 0 -> Error
; -----------------------------------------------------

Login PROC

```
mov qword ptr [intentos],0
```

Reintentar:

```
lea rcx,tituloLogin
call printf

lea rcx,msgCuenta
call printf

lea rcx,fmtStr
lea rdx,cuentaIngresada
call scanf

lea rcx,msgNip
call printf

lea rcx,fmtStr
lea rdx,nipIngresado
call scanf

; Validar cuenta

lea rcx,cuentaIngresada
lea rdx,cuentaValida
call strcmp

test eax,eax
jne ErrorLogin

; Validar NIP

lea rcx,nipIngresado
lea rdx,nipValido
call strcmp

test eax,eax
jne ErrorLogin

lea rcx,msgOk
call printf

mov rax,1
ret
```

ErrorLogin:

```
lea rcx,msgError
call printf

inc qword ptr [intentos]

mov rax,[intentos]
cmp rax,3
jl Reintentar

xor rax,rax
ret
```

Login ENDP

END
