# 🗄️ Fase 3 — Preparación y análisis en SQL

Esta carpeta contiene los scripts desarrollados y validados para **MySQL 8.0**, utilizando **MySQL Workbench 8.0 CE** como cliente.

## 📌 Orden de ejecución

1. `01_creacion_base_tabla.sql`
2. Importar el CSV original mediante **Table Data Import Wizard**
3. `02_validacion_calidad.sql`
4. `03_analisis_mercado.sql`
5. `04_crecimiento.sql`
6. `05_rankings_kpis.sql`

## 📂 Descripción de los scripts

| Archivo | Propósito |
|---|---|
| `01_creacion_base_tabla.sql` | Crea la base de datos, la tabla principal, la clave primaria y los índices. |
| `02_validacion_calidad.sql` | Reproduce en SQL los controles de calidad ejecutados previamente en Power Query. |
| `03_analisis_mercado.sql` | Analiza tamaño de mercado, participación, resultados, eficiencia, mix de productos y origen de capital. |
| `04_crecimiento.sql` | Calcula crecimiento trimestral e interanual mediante CTE y `LAG()`. |
| `05_rankings_kpis.sql` | Construye rankings con `RANK()` para participación, crecimiento, margen técnico y solvencia sintética. |

## 🧱 Granularidad y clave

Una fila representa:

```text
1 compañía ficticia + 1 trimestre
```

La clave primaria utilizada es:

```sql
PRIMARY KEY (compania_id, periodo)
```

## ✅ Validaciones confirmadas

La importación fue validada con los siguientes resultados:

- 144 registros.
- 39 variables.
- 12 compañías ficticias.
- 12 períodos trimestrales.
- 0 valores nulos.
- 0 duplicados en `compania_id + periodo`.
- 0 inconsistencias temporales.
- Diferencias menores de redondeo consistentes con la auditoría de la Fase 2.
- Consultas descriptivas, de crecimiento y rankings ejecutadas correctamente.

## 🛠️ Recursos SQL demostrados

- `CREATE DATABASE`
- `CREATE TABLE`
- Tipos `DATE`, `VARCHAR`, `CHAR`, `INT`, `BIGINT` y `DECIMAL`
- Clave primaria e índices
- `SELECT`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`
- `SUM()`, `COUNT()`, `AVG()`, `MIN()` y `MAX()`
- Subconsultas
- `NULLIF()`
- `UNION ALL`
- Common Table Expressions (`WITH`)
- Funciones de ventana
- `LAG()`
- `RANK() OVER()`

## ⚠️ Limitación DQ-01

La variable `roe_anualizado_pct` es internamente consistente, pero presenta valores sistemáticamente elevados por la lógica de generación del dataset sintético.

Por este motivo:

- se conserva para fines educativos;
- no se utiliza como benchmark frente a compañías reales;
- se excluye de los rankings principales;
- debe interpretarse como una limitación de plausibilidad, no como un error de integridad.

## 🔄 Reimportación del dataset

Si necesitas importar nuevamente el CSV en la misma tabla, vacía primero los registros existentes:

```sql
USE seguros_vida_chile;
TRUNCATE TABLE mercado_asegurador_vida;
```

Ejecuta `TRUNCATE TABLE` únicamente cuando quieras reiniciar deliberadamente la carga, ya que elimina todos los registros de la tabla.

## 📄 Documentación complementaria

➡️ [Consultar metodología y resultados de la Fase 3](../documentacion/metodologia_sql.md)
