---
tipo: concepto
tags: [sql, spark, pandas, relacional]
nivel: basico
---

# JOIN

## ¿Qué es? (en una frase)
Combinar filas de dos o más tablas usando una columna en común (la clave).

## ¿Para qué sirve?
Los datos en bases de datos están separados en tablas (ver [[normalizacion]]). JOIN te permite reunirlos cuando necesitas información de varias tablas a la vez. Es la operación más usada en SQL.

## Ejemplo mínimo
```sql
SELECT clientes.nombre, pedidos.total
FROM tienda.clientes
INNER JOIN tienda.pedidos ON clientes.cliente_id = pedidos.cliente_id;
```

## Tipos de JOIN

| Tipo | Qué devuelve |
|------|-------------|
| INNER JOIN | Solo filas que hacen match en ambas tablas |
| LEFT JOIN | Todas las filas de la izquierda + match de la derecha (NULL si no hay) |
| RIGHT JOIN | Todas las filas de la derecha + match de la izquierda (NULL si no hay) |
| FULL OUTER JOIN | Todas las filas de ambas tablas (NULL donde no hay match) |
| CROSS JOIN | Todas las combinaciones posibles (cuidado: tabla gigante) |

## Aparece en estos videos
- [[EP05-joins-sql]] → INNER, LEFT, RIGHT, FULL, CROSS en PostgreSQL
- [[EP09-sql-vida-real]] → JOINs en ejercicio completo de e-commerce
- [[EP15-pandas-2]] → pd.merge() es el equivalente en Python
- [[EP19-spark-joins]] → df.join() en PySpark, misma lógica a escala
- [[EP23-medallion]] → JOINs en silver layer para enriquecer datos

## Equivalentes en otros lenguajes

| SQL | Python (Pandas) | Spark (PySpark) |
|-----|-----------------|-----------------|
| `INNER JOIN ON` | `pd.merge(how='inner')` | `df.join(other, on=, how='inner')` |
| `LEFT JOIN ON` | `pd.merge(how='left')` | `df.join(other, on=, how='left')` |
| `RIGHT JOIN ON` | `pd.merge(how='right')` | `df.join(other, on=, how='right')` |
| `FULL OUTER JOIN` | `pd.merge(how='outer')` | `df.join(other, on=, how='outer')` |

## Conceptos relacionados
- [[clave-primaria]] — la columna que identifica cada fila única
- [[clave-foranea]] — la columna que referencia otra tabla
- [[normalizacion]] — la razón por la que necesitas JOINs
- [[group-by]] — después de unir tablas, sueles agregar datos
- [[where]] — filtrar después de unir

## Errores comunes
1. JOIN sin ON → produce un CROSS JOIN accidental (millones de filas)
2. JOIN con columnas que tienen NULLs → los NULLs nunca hacen match en INNER
3. Confundir LEFT con RIGHT → LEFT mantiene TODAS las filas de la tabla izquierda
4. No usar alias → las consultas se vuelven ilegibles con 3+ tablas
