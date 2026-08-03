🗄️ Preparación, análisis y validación en SQL

Esta carpeta contiene los scripts desarrollados y validados para MySQL 8.0, utilizando MySQL Workbench 8.0 CE como cliente.

📌 Orden de ejecución
**Estado:** 🟡 En desarrollo - Fase 4 completada  
**Período analizado:** 2023-T1 a 2025-T4  
**Compañías:** 12 aseguradoras ficticias  
**Dataset:** 144 observaciones trimestrales  
**Herramientas utilizadas hasta ahora:** GitHub · Markdown  
**Stack planificado:** Excel · Power Query · SQL · Power BI · DAX

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
- ✅ **Fase 1:** Definición del problema de negocio.
- ✅ **Fase 2:** Auditoría y limpieza de datos.
- ✅ **Fase 3:** Preparación y análisis en SQL.
- ✅ **Fase 4:** Construcción y validación de KPIs.
- ⏳ **Fase 5:** Modelado de datos en Power BI.
- ⏳ **Fase 6:** Desarrollo del dashboard ejecutivo.
- ⏳ **Fase 7:** Análisis de resultados, insights y recomendaciones.
- ⏳ **Fase 8:** Documentación y publicación final del proyecto.

1 compañía ficticia + 1 trimestre

La clave primaria utilizada es:

PRIMARY KEY (compania_id, periodo)

✅ Validaciones confirmadas
- GitHub
- Markdown
- Microsoft Excel
- Power Query
- SQL

144 registros y 39 variables.

12 compañías ficticias y 12 períodos trimestrales.

0 valores nulos.
- Microsoft Power BI
- DAX

---
### ✅ Calidad de datos - Fase 2

0 duplicados en compania_id + periodo.

0 inconsistencias temporales.

Diferencias de redondeo consistentes con la auditoría de Power Query.

Consultas descriptivas, temporales y rankings ejecutados correctamente.

Catálogo de KPIs validado contra SQL.

Participación de mercado recalculada igual a 100,00% por período.

Diferencias de siniestralidad, gastos y solvencia inferiores a 0,01 puntos porcentuales.
---
### 🗄️ Análisis en SQL - Fase 3

El dataset fue importado y analizado en MySQL 8.0 mediante MySQL Workbench 8.0 CE.

La fase incluyó:

- Creación de la base de datos y una tabla de 39 variables.
- Definición de la clave primaria `compania_id + periodo`.
- Reproducción de los controles de calidad de Power Query.
- Análisis de primas, participación, resultados, eficiencia y mix de productos.
- Cálculo de crecimiento trimestral e interanual mediante `LAG()`.
- Construcción de rankings mediante `RANK() OVER()`.

**Resultados descriptivos destacados del escenario sintético:**

- La prima directa total aumentó aproximadamente 26,50% entre 2023-T1 y 2025-T4.
- VidaGlobal lideró la participación de mercado en 2025-T4 con 17,32%.
- Horizonte Vida presentó el mayor crecimiento interanual en 2025-T4 con 10,83%.
- Pacífico Futuro Vida obtuvo el mayor margen técnico acumulado con 39,73%.
- AndesCare Vida presentó el mayor ratio de solvencia sintética en 2025-T4 con 222,51%.

--- 
### 📐 Catálogo y validación de KPIs - Fase 4

Se definió y validó un catálogo de 12 KPIs para asegurar que las métricas del futuro dashboard mantengan una fórmula, unidad, granularidad e interpretación consistentes.

La fase incluyó:

- Clasificación de medidas aditivas, semi-aditivas y no aditivas.
- Definición de fórmulas ponderadas para siniestralidad, gastos, margen técnico y solvencia sintética.
- Reglas temporales para crecimiento QoQ y YoY.
- Validación de valores de referencia para 2025-T4.
- Exclusión del ROE sintético del conjunto principal por la limitación DQ-01.
- Preparación de controles para comparar SQL con la futura implementación en Power BI.

**Valores de referencia del escenario sintético para 2025-T4:**

- Prima directa: 2.435.934 MM CLP.
- Crecimiento QoQ: 4,77%.
- Crecimiento YoY: 4,29%.
- Siniestralidad ponderada: 55,70%.
- Ratio de gastos: 12,79%.
- Margen técnico: 31,51%.
- Ratio de solvencia sintético: 180,48%.
- Asegurados vigentes: 9.134.304.

➡️ [Consultar diccionario de KPIs](documentacion/diccionario_kpis.md)

🔧 [Ver script de validación](sql/06_validacion_kpis.sql)

➡️ [Ver scripts y orden de ejecución](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/tree/sql)

📄 [Consultar metodología y resultados SQL](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/sql/documentacion/metodologia_sql.md)

---

## 🗂️ Estructura actual del repositorio

<img width="765" height="623" alt="image" src="https://github.com/user-attachments/assets/f81ca043-8551-4d82-8ae5-1684dd99cede" />



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
