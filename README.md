
# 🏦 ATM ASM
### Simulador de Cajero Automático desarrollado en MASM64 (x64 Assembly)

<div align="center">

![Assembly](https://img.shields.io/badge/Assembly-MASM64-blue?style=for-the-badge)
![Windows](https://img.shields.io/badge/Windows-10%2F11-0078D6?style=for-the-badge&logo=windows)
![Architecture](https://img.shields.io/badge/Architecture-x64-red?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/windows8/windows8-original.svg" width="120"/>

### 💳 Simulación completa de un sistema bancario tipo ATM utilizando lenguaje ensamblador de 64 bits.

</div>

---

# 📖 Descripción

**ATM ASM** es un simulador de cajero automático desarrollado completamente en **MASM64 (Microsoft Macro Assembler 64 bits)**.

El proyecto tiene como finalidad demostrar el desarrollo de una aplicación modular en lenguaje ensamblador, implementando operaciones bancarias similares a las utilizadas por los cajeros automáticos reales.

Todo el sistema está dividido en módulos independientes para facilitar su mantenimiento y escalabilidad.

---

# ✨ Características

- 🔐 Inicio de sesión mediante número de cuenta y NIP.
- 👤 Administración de usuarios.
- 💰 Consulta de saldo.
- 💵 Depósitos.
- 💸 Retiros.
- 🔄 Transferencias entre cuentas.
- 📜 Historial de movimientos.
- 🔑 Cambio de NIP.
- 🛡️ Validaciones de seguridad.
- 📂 Persistencia de información mediante archivos.
- 📊 Base de datos simulada.
- 🏦 Panel de administrador.
- 📁 Arquitectura modular.

---

# 🧠 Tecnologías

- MASM64
- Assembly x64
- Windows API
- MSVCRT
- Archivos DAT
- Visual Studio
- Microsoft Macro Assembler

---

# 📂 Estructura del proyecto

```text
ATM-ASM/
│
├── main.asm
├── login.asm
├── menu.asm
├── consulta.asm
├── deposito.asm
├── retiro.asm
├── transferencia.asm
├── historial.asm
├── cambio_nip.asm
├── admin.asm
├── util.asm
│
├── macros.inc
├── recursos.inc
│
├── banco.dat
├── Historial.dat
│
├── README.md
│
└── screenshots/
```

---

# 🔐 Funcionalidades

## Inicio de sesión

- Número de cuenta.
- Validación del NIP.
- Máximo de intentos.
- Bloqueo de acceso.

---

## Consulta de saldo

Permite visualizar:

- Número de cuenta.
- Titular.
- Saldo disponible.

---

## Depósitos

- Validación del monto.
- Actualización del saldo.
- Registro del movimiento.

---

## Retiros

- Validación de saldo.
- Validación de múltiplos de 50.
- Actualización del saldo.
- Registro del movimiento.

---

## Transferencias

- Cuenta destino.
- Validación de cuenta.
- Actualización de ambas cuentas.
- Registro de operación.

---

## Historial

Registro completo de:

- Inicio de sesión.
- Depósitos.
- Retiros.
- Transferencias.
- Cambio de NIP.
- Consultas.

---

## Cambio de NIP

- Validación del NIP anterior.
- Confirmación.
- Actualización del archivo.

---

## Administrador

El panel administrativo permite:

- Ver usuarios.
- Crear cuentas.
- Eliminar cuentas.
- Modificar saldo.
- Consultar historial.
- Respaldar la base de datos.

---

# 💾 Base de datos

El sistema utiliza archivos planos.

## banco.dat

```text
Cuenta|Nombre|NIP|Saldo|Estado|TipoCuenta
```

Ejemplo

```text
10000001|ISAI REYES PEÑA|1234|25000|ACTIVO|AHORRO
```

---

## Historial.dat

```text
Cuenta|Fecha|Hora|Operacion|Monto|Saldo|Descripcion
```

Ejemplo

```text
10000001|08/07/2026|08:15|DEPOSITO|500|25500|Deposito ATM
```

---

# 🛠 Arquitectura

```text
main.asm
      │
      ▼
login.asm
      │
      ▼
menu.asm
      │
 ┌────┼────────────────────────────┐
 │    │    │    │    │    │        │
 ▼    ▼    ▼    ▼    ▼    ▼        ▼
Consulta
Deposito
Retiro
Transferencia
Historial
Cambio NIP
Administrador
```

---

# 📊 Validaciones

- Cuenta existente.
- NIP correcto.
- Saldo suficiente.
- Monto positivo.
- Transferencias válidas.
- Cambio correcto de NIP.
- Cuenta activa.
- Cuenta no bloqueada.
- Máximo de intentos.
- Múltiplos de 50.

---

# 📸 Capturas

```text
screenshots/
```

Ejemplo

- Login
- Menú Principal
- Consulta
- Depósito
- Retiro
- Transferencia
- Historial
- Administrador

---

# 🚀 Compilación

Compilar utilizando MASM64.

Ejemplo:

```cmd
ml64 /c *.asm

link *.obj msvcrt.lib kernel32.lib
```

---

# 📈 Características técnicas

- Arquitectura de 64 bits.
- Programación modular.
- Uso de procedimientos.
- Uso de macros.
- Manejo de archivos.
- Manejo de memoria.
- Validaciones.
- Persistencia de datos.
- Simulación bancaria.
- Código reutilizable.

---

# 🎯 Objetivos

- Practicar programación en ensamblador.
- Comprender el manejo de archivos.
- Simular un sistema bancario.
- Aplicar programación modular.
- Implementar estructuras reutilizables.

---

# 📚 Conocimientos aplicados

- Microsoft Macro Assembler.
- Windows API.
- MSVCRT.
- Procedimientos.
- Macros.
- Buffers.
- Conversión de datos.
- Validaciones.
- Entrada y salida.
- Archivos.
- Memoria.

---

# 📄 Licencia

Este proyecto se distribuye bajo la licencia **MIT**.

---

<div align="center">

## ⭐ Si este proyecto te resulta útil, no olvides dejar una estrella en GitHub.

**Desarrollado con MASM64 y Assembly x64**

</div>

