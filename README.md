# 🛡️ Análisis del Mercado Chileno de Seguros de Vida

> 📊 Proyecto de Business Intelligence con datos sintéticos, inspirado en conceptos e indicadores del mercado asegurador chileno.

**Estado:** 🟡 En desarrollo - Fase 3 completada  
**Período analizado:** 2023-T1 a 2025-T4  
**Compañías:** 12 aseguradoras ficticias  
**Dataset:** 144 observaciones trimestrales  
**Herramientas utilizadas hasta ahora:** GitHub · Markdown  
**Stack planificado:** Excel · Power Query · SQL · Power BI · DAX

---

## 📌 Sobre el proyecto

Este proyecto de portafolio busca desarrollar una solución de Business Intelligence para analizar el desempeño competitivo, financiero y operacional de un mercado ficticio de seguros de vida en Chile.

El análisis utilizará datos 100% sintéticos y se enfocará en indicadores como prima directa, participación de mercado, crecimiento, siniestralidad, eficiencia operacional, rentabilidad, solvencia y composición del negocio.

El objetivo es simular un caso de negocio cercano a los desafíos que podría enfrentar un equipo de Estrategia, Business Intelligence o Analítica dentro de una compañía multinacional de seguros de vida.

---

## 🎯 Objetivo

Desarrollar una solución de Business Intelligence que permita analizar y comparar el desempeño de compañías ficticias del mercado chileno de seguros de vida durante el período 2023-2025, identificando tendencias y diferencias relevantes que puedan apoyar la toma de decisiones estratégicas.

Para consultar la definición completa del problema, stakeholders, objetivos, preguntas de negocio e hipótesis:

➡️ [Ver definición completa del proyecto](definicion_proyecto.md)

---

## ❓ Preguntas clave del análisis

El proyecto busca responder, entre otras, las siguientes preguntas:

- ¿Cómo ha evolucionado el tamaño del mercado y qué compañías están creciendo con mayor rapidez?
- ¿Qué aseguradoras lideran en participación de mercado y cuáles están ganando o perdiendo posición?
- ¿Existe una relación entre tamaño de mercado, rentabilidad y resultado técnico?
- ¿Qué compañías presentan mayores niveles de siniestralidad y eficiencia de gastos?
- ¿Cómo se comparan las aseguradoras en solvencia, fortaleza financiera y composición de productos?

➡️ [Consultar las 10 preguntas de negocio e hipótesis](definicion_proyecto.md)

---

## 🗃️ Dataset

El dataset contiene información trimestral sintética de 12 compañías ficticias de seguros de vida entre 2023-T1 y 2025-T4.

**Características principales:**

- 144 observaciones.
- 12 aseguradoras ficticias.
- 12 períodos trimestrales.
- Variables financieras, comerciales, operacionales y de solvencia.
- Datos creados exclusivamente con fines educativos y de portafolio.

📄 [Ver dataset original](datos/raw/mercado_asegurador_vida_chile_sintetico.csv)

---

## 🧭 Metodología y estado del proyecto

- ✅ **Fase 1:** Definición del problema de negocio.
- ✅ **Fase 2:** Auditoría y limpieza de datos.
- ✅ **Fase 3:** Preparación y análisis en SQL.
- ⏳ **Fase 4:** Construcción y validación de KPIs.
- ⏳ **Fase 5:** Modelado de datos en Power BI.
- ⏳ **Fase 6:** Desarrollo del dashboard ejecutivo.
- ⏳ **Fase 7:** Análisis de resultados, insights y recomendaciones.
- ⏳ **Fase 8:** Documentación y publicación final del proyecto.

---

## 🧰 Tecnologías

### Utilizadas hasta ahora

- GitHub
- Markdown
- Microsoft Excel
- Power Query
- SQL

### Planificadas para las siguientes fases

- Microsoft Power BI
- DAX

---
### ✅ Calidad de datos - (resultado simplificado de la fase 2)

La auditoría realizada en Power Query confirmó:

- 144 observaciones y 39 variables.
- 0 valores nulos.
- 0 filas duplicadas.
- 0 duplicados en la clave lógica `compania_id + periodo`.
- Coherencia temporal entre período, año, trimestre y fecha de cierre.
- Diferencias menores de redondeo en primas, balance y participación de mercado.
- Una limitación documentada de plausibilidad en el ROE sintético.

➡️ [Ver auditoría completa de calidad de datos](documentacion/auditoria_calidad_datos.md)

📘 [Consultar diccionario de datos](documentacion/Diccionario de datos.md)

🔧 [Ver consulta de Power Query](power_query/mercado_asegurador_vida_raw.pq)

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

➡️ [Ver scripts y orden de ejecución](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/tree/sql)

📄 [Consultar metodología y resultados SQL](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/sql/documentacion/metodologia_sql.md)

## 🗂️ Estructura actual del repositorio

<img width="613" height="527" alt="image" src="https://github.com/user-attachments/assets/b3b444ad-8cfd-48dc-991f-19ef6d4d5d18" />


