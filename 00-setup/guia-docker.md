# Guía: Instalar Docker Desktop

> Esta guía corresponde al **EP.00 — Tu laboratorio de datos en 20 minutos**

## ¿Qué es Docker?

Docker permite correr aplicaciones en contenedores aislados. En vez de instalar PostgreSQL, Jupyter, Spark, etc. directamente en tu PC, los corremos dentro de contenedores. Si algo se rompe, solo borras el contenedor y vuelves a crearlo.

## Instalación

### 1. Descargar Docker Desktop

Ve a https://www.docker.com/products/docker-desktop/ y descarga la versión para Windows.

### 2. Instalar

Ejecuta el instalador. Asegúrate de que "Use WSL 2 instead of Hyper-V" esté marcado.

### 3. Reiniciar

Docker te pedirá reiniciar. Hazlo.

### 4. Verificar integración con WSL2

Abre Docker Desktop → Settings → Resources → WSL Integration → Activa Ubuntu.

### 5. Verificar en terminal

```bash
# En tu terminal de Ubuntu (WSL2)
docker --version
docker-compose --version
```

## Comandos esenciales

```bash
# Ver contenedores corriendo
docker ps

# Ver TODOS los contenedores (incluso detenidos)
docker ps -a

# Levantar servicios definidos en docker-compose.yml
docker-compose up -d

# Ver logs de un servicio
docker-compose logs jupyter

# Detener todo
docker-compose down

# Detener y borrar datos (reset completo)
docker-compose down -v
```

## Errores comunes

| Error | Solución |
|-------|---------|
| "Docker daemon not running" | Abrir Docker Desktop y esperar que inicie |
| "Port already in use" | Otro programa usa el puerto. `docker ps` para verificar |
| WSL2 no aparece en Docker settings | Reinstalar WSL2 update |

## Siguiente paso

→ [[guia-vscode]] — Instalar VS Code con extensiones
