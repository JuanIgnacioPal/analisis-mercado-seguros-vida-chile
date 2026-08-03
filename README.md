🗄️ Preparación, análisis y validación en SQL

Esta carpeta contiene los scripts desarrollados y validados para MySQL 8.0, utilizando MySQL Workbench 8.0 CE como cliente.

📌 Orden de ejecución

01_creacion_base_tabla.sql

Importar el CSV original mediante Table Data Import Wizard

02_validacion_calidad.sql

03_analisis_mercado.sql

04_crecimiento.sql

05_rankings_kpis.sql

06_validacion_kpis.sql

📂 Descripción de los scripts

Archivo

Propósito

01_creacion_base_tabla.sql

Crea la base de datos, la tabla principal, la clave primaria y los índices.

02_validacion_calidad.sql

Reproduce en SQL los controles de calidad realizados previamente en Power Query.

03_analisis_mercado.sql

Analiza tamaño de mercado, participación, resultados, eficiencia, mix de productos y origen de capital.

04_crecimiento.sql

Calcula crecimiento trimestral e interanual mediante CTE y LAG().

05_rankings_kpis.sql

Construye rankings con RANK() para participación, crecimiento, margen técnico y solvencia sintética.

06_validacion_kpis.sql

Valida el catálogo formal de KPIs y fija valores de referencia para la futura implementación en Power BI.

🧱 Granularidad y clave

Una fila representa:

1 compañía ficticia + 1 trimestre

La clave primaria utilizada es:

PRIMARY KEY (compania_id, periodo)

✅ Validaciones confirmadas

144 registros y 39 variables.

12 compañías ficticias y 12 períodos trimestrales.

0 valores nulos.

0 duplicados en compania_id + periodo.

0 inconsistencias temporales.

Diferencias de redondeo consistentes con la auditoría de Power Query.

Consultas descriptivas, temporales y rankings ejecutados correctamente.

Catálogo de KPIs validado contra SQL.

Participación de mercado recalculada igual a 100,00% por período.

Diferencias de siniestralidad, gastos y solvencia inferiores a 0,01 puntos porcentuales.

📐 KPIs validados

La Fase 4 formalizó y validó:

Prima directa.

Participación de mercado.

Crecimiento QoQ y YoY.

Siniestralidad ponderada.

Ratio de gastos.

Resultado y margen técnico.

Resultado neto.

Ratio de solvencia sintético.

Asegurados vigentes.

Crecimiento YoY de asegurados.

➡️ [Consultar el diccionario de KPIs](documentacion/diccionario_kpis.md)

⚠️ Limitación DQ-01

roe_anualizado_pct se conserva como ejemplo de limitación de plausibilidad, pero queda excluido de las tarjetas, rankings y benchmarks principales.


## 📄 Documentación complementaria

➡️ [Consultar metodología y resultados de la Fase 3]([../documentacion/metodologia_sql.md](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/sql/documentacion/metodologia_sql.md))
