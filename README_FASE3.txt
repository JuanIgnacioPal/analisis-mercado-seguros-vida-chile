# Fase 3 - SQL

Scripts desarrollados para MySQL 8.0 / MySQL Workbench 8.0 CE.

Orden recomendado de ejecucion:

1. `01_creacion_base_tabla.sql`
2. Importar el CSV con **Table Data Import Wizard** de MySQL Workbench.
3. `02_validacion_calidad.sql`
4. `03_analisis_mercado.sql`
5. `04_crecimiento.sql`
6. `05_rankings_kpis.sql`

El archivo CSV original permanece en `datos/raw/`.

La limitacion DQ-01 del ROE documentada en Fase 2 se mantiene: el ROE sintetico no se utiliza como benchmark frente a companias reales.
