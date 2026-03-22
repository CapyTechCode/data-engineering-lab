# 🦫 CapyTech — Data Engineering Lab

Aprende Data Engineering desde cero, paso a paso. Sin asumir que sabes algo.

## ¿Qué es esto?

Un laboratorio completo de Data Engineering que corre en tu PC con un solo comando. Incluye:

- **JupyterLab** — notebooks para Python, SQL, PySpark
- **PostgreSQL** — base de datos relacional para practicar SQL
- **Apache Spark** — procesamiento de datos a escala (se agrega en Fase 2)
- **Apache Airflow** — orquestación de pipelines (se agrega en Fase 4)

## Requisitos

- Windows 10/11 con WSL2 instalado
- Docker Desktop
- VS Code
- Git

> ¿No tienes nada instalado? Empieza por el [EP.00 — Setup del laboratorio](https://www.youtube.com/@CapyTechCode)

## Inicio rápido

```bash
# 1. Clona el repositorio
git clone https://github.com/capytech/data-engineering-lab.git
cd data-engineering-lab

# 2. Copia las variables de entorno
cp .env.example .env

# 3. Levanta el stack
docker-compose up -d

# 4. Abre JupyterLab en tu navegador
# http://localhost:8888 (token: capytech)

# 5. Abre pgAdmin para SQL
# http://localhost:5050 (admin@capytech.dev / capytech)
```

## Estructura del curso

| Fase | Tema | Episodios | Carpeta |
|------|------|-----------|---------|
| 0 | Setup del laboratorio | EP.00 - EP.03 | `00-setup/` |
| 1a | SQL desde cero | EP.04 - EP.09 | `01-sql/` |
| 1b | Python desde cero | EP.10 - EP.16 | `02-python/` |
| 2 | Apache Spark + ETL/ELT | EP.17 - EP.24 | `03-spark/` y `04-etl-elt/` |
| 3 | Modelado de datos | EP.25 - EP.30 | `05-modelado/` |
| 4 | Airflow + Iceberg | EP.31 - EP.35 | `06-airflow/` y `07-iceberg/` |
| 5 | Proyecto final | EP.36 - EP.38 | `proyecto-final/` |

## Notas de estudio (Obsidian)

La carpeta `obsidian-vault/` contiene notas interconectadas de cada concepto. Para usarlas:

1. Descarga [Obsidian](https://obsidian.md) (gratis)
2. Abre la carpeta `obsidian-vault/` como vault
3. Navega el grafo de conocimiento

Cada concepto te dice en qué videos aparece y cómo se relaciona con otros conceptos.

## Flashcards (Anki)

La carpeta `anki-decks/` contiene mazos de Anki para memorizar sintaxis:

1. Descarga [Anki](https://apps.ankiweb.net) (gratis)
2. Importa los archivos `.apkg`
3. Repasa 10 minutos al día

## Stack técnico

```
┌─────────────────────────────────────────┐
│              Docker Compose             │
├──────────┬──────────┬───────────────────┤
│ Jupyter  │ pgAdmin  │  (Fase 2+: Spark,│
│ Lab      │          │   Airflow, MinIO) │
├──────────┴──────────┴───────────────────┤
│              PostgreSQL                 │
└─────────────────────────────────────────┘
```

## Contribuir

¿Encontraste un error? ¿Tienes una sugerencia? Abre un issue o un PR.

## Canal

- YouTube: [@capytech](https://youtube.com/@capytech)
- GitHub: [capytech](https://github.com/capytech)

---

Hecho con 🧉 por CapyTech
