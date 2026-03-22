# Guía: Instalar VS Code

> Esta guía corresponde al **EP.00 — Tu laboratorio de datos en 20 minutos**

## Instalación

1. Descargar de https://code.visualstudio.com
2. Instalar (marcar "Add to PATH")

## Extensiones esenciales

Abrir VS Code → Ctrl+Shift+X → buscar e instalar:

| Extensión | Para qué |
|-----------|----------|
| WSL | Conectar VS Code a Ubuntu |
| Python | Syntax, linting, Jupyter |
| Jupyter | Notebooks dentro de VS Code |
| Docker | Gestionar contenedores |
| GitLens | Historial de Git visual |
| SQL Tools | Conectar a PostgreSQL |
| SQL Tools PostgreSQL | Driver para SQL Tools |

## Conectar a WSL2

1. Ctrl+Shift+P → "WSL: Connect to WSL"
2. VS Code se reabre conectado a Ubuntu
3. La terminal integrada ahora es bash de Ubuntu

## Verificar

```bash
# En la terminal integrada de VS Code (debería ser bash de Ubuntu)
pwd          # Debería mostrar /home/tu-usuario
python3 --version
docker --version
```

## Tips

- Siempre trabaja conectado a WSL (esquina inferior izquierda dice "WSL: Ubuntu")
- Usa `Ctrl+`` para abrir/cerrar la terminal integrada
- Usa `Ctrl+Shift+P` para buscar cualquier comando

## Siguiente paso

→ [[guia-git]] — Configurar Git y GitHub
