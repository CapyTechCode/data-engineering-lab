# Guía: Instalar WSL2

> Esta guía corresponde al **EP.00 — Tu laboratorio de datos en 20 minutos**

## ¿Qué es WSL2?

Windows Subsystem for Linux. Te permite correr Ubuntu dentro de Windows sin necesidad de una máquina virtual. Es Linux real con kernel completo.

## Instalación

### 1. Abrir PowerShell como administrador

Click derecho en el menú inicio → "Windows PowerShell (Admin)"

### 2. Instalar WSL2

```powershell
wsl --install
```

Esto instala WSL2 + Ubuntu automáticamente. Reinicia tu PC cuando te lo pida.

### 3. Configurar Ubuntu

Después de reiniciar, se abrirá Ubuntu automáticamente. Te pedirá:
- Un nombre de usuario (usa algo simple, sin espacios)
- Una contraseña (no se muestra mientras escribes, es normal)

### 4. Verificar

```bash
# En la terminal de Ubuntu
cat /etc/os-release    # Debería decir Ubuntu
uname -r               # Debería incluir "microsoft" en el nombre
```

### 5. Actualizar paquetes

```bash
sudo apt update && sudo apt upgrade -y
```

## Verificación final

```bash
# Todo esto debería funcionar:
python3 --version
git --version
```

## Errores comunes

| Error | Solución |
|-------|---------|
| "WSL2 requires an update" | Descargar el kernel update de Microsoft |
| "Virtualización no habilitada" | Activar VT-x/AMD-V en la BIOS |
| Terminal no abre después de reinicio | Buscar "Ubuntu" en el menú inicio |

## Siguiente paso

→ [[guia-docker]] — Instalar Docker Desktop
