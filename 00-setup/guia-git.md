# Guía: Configurar Git y GitHub

> Esta guía corresponde al **EP.02 — Git y GitHub: versiona tu código como profesional**

## Instalar Git (en WSL2)

```bash
sudo apt install git -y
git --version
```

## Configurar identidad

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
git config --global init.defaultBranch main
```

## Generar SSH key para GitHub

```bash
# Generar la clave
ssh-keygen -t ed25519 -C "tu@email.com"
# Presiona Enter 3 veces (defaults)

# Copiar la clave pública
cat ~/.ssh/id_ed25519.pub
```

## Agregar SSH key a GitHub

1. Ve a https://github.com/settings/keys
2. Click "New SSH key"
3. Pega la clave que copiaste
4. Guardar

## Verificar conexión

```bash
ssh -T git@github.com
# Debería decir: "Hi usuario! You've successfully authenticated"
```

## Comandos esenciales

```bash
# Crear repo nuevo
git init

# Ver estado
git status

# Agregar cambios
git add .                    # todo
git add archivo.py           # un archivo específico

# Commitear
git commit -m "descripción de lo que hice"

# Conectar con GitHub
git remote add origin git@github.com:usuario/repo.git

# Subir cambios
git push origin main

# Bajar cambios
git pull origin main

# Ver historial
git log --oneline
```

## Flujo diario

```bash
# 1. Antes de empezar a trabajar
git pull origin main

# 2. Trabajar en tu código...

# 3. Al terminar
git add .
git commit -m "EP04: ejercicios de SELECT y WHERE"
git push origin main
```

## Errores comunes

| Error | Solución |
|-------|---------|
| "Permission denied (publickey)" | La SSH key no está configurada bien |
| "Merge conflict" | Dos personas editaron lo mismo. Git te marca dónde |
| "Detached HEAD" | `git checkout main` para volver a la rama principal |

## Siguiente paso

→ Clonar el repo: `git clone git@github.com:capytech/data-engineering-lab.git`
