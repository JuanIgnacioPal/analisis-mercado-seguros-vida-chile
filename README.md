# 🛡️ Análisis del Mercado Chileno de Seguros de Vida

> 📊 Proyecto de Business Intelligence con datos sintéticos, inspirado en conceptos e indicadores del mercado asegurador chileno.

**Estado:** 🟡 En desarrollo - Fase 5 completada  
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

➡️ [Ver definición completa del proyecto](definicion_proyecto.md#escenario)

---

## ❓ Preguntas clave del análisis

El proyecto busca responder, entre otras, las siguientes preguntas:

- ¿Cómo ha evolucionado el tamaño del mercado y qué compañías están creciendo con mayor rapidez?
- ¿Qué aseguradoras lideran en participación de mercado y cuáles están ganando o perdiendo posición?
- ¿Existe una relación entre tamaño de mercado, rentabilidad y resultado técnico?
- ¿Qué compañías presentan mayores niveles de siniestralidad y eficiencia de gastos?
- ¿Cómo se comparan las aseguradoras en solvencia, fortaleza financiera y composición de productos?

➡️ [Consultar las 10 preguntas de negocio e hipótesis](definicion_proyecto.md#preguntas-de-negocio)

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
- ✅ **Fase 4:** Construcción y validación de KPIs.
- ✅ **Fase 5:** Modelado de datos en Power BI.
- ⏳ **Fase 6:** Desarrollo del dashboard ejecutivo.
- ⏳ **Fase 7:** Análisis de resultados, insights y recomendaciones.
- ⏳ **Fase 8:** Documentación y publicación final del proyecto.

---
# 📌 Fase 2 — Calidad de datos

Se realizó una auditoría completa del dataset sintético con el objetivo de garantizar que los análisis posteriores se construyeran sobre información consistente.

### ✔ Resultados obtenidos

- 144 registros validados.
- 39 variables documentadas.
- 0 registros duplicados.
- 0 valores nulos.
- Consistencia entre tipos de datos y reglas de negocio.
- Normalización de nombres de compañías y períodos.
- Elaboración del diccionario de datos.
- Registro completo de la metodología de limpieza.

### 📚 Documentación

📄 [Auditoría de calidad de datos](documentacion/auditoria_calidad_datos.md)

📘 [Diccionario de datos](documentacion/diccionario_datos.md)

🔧 [Consulta Power Query](power_query/mercado_asegurador_vida_raw.pq)

---

# 🗄 Fase 3 — Análisis en SQL

Una vez validada la calidad de los datos, se construyó la capa analítica utilizando MySQL Workbench 8.0 CE.

Durante esta etapa se desarrollaron consultas para responder preguntas de negocio relacionadas con crecimiento, participación de mercado, rentabilidad y solvencia.

### ✔ Resultados obtenidos

- Creación de la base de datos y tabla principal.
- Definición de clave primaria compuesta e índices.
- Validación completa de la carga del dataset.
- Análisis descriptivo del mercado.
- Cálculo de crecimiento trimestral (QoQ).
- Cálculo de crecimiento interanual (YoY).
- Construcción de rankings de compañías.
- Validación de indicadores mediante SQL.

### 📈 Principales hallazgos del escenario sintético

- La prima directa total aumentó aproximadamente **26,5 %** entre **2023-T1** y **2025-T4**.
- VidaGlobal lideró la participación de mercado en **2025-T4** con **17,32 %**.
- Horizonte Vida presentó el mayor crecimiento interanual (**10,83 %**).
- Pacífico Futuro Vida obtuvo el mayor margen técnico (**39,73 %**).
- AndesCare Vida presentó el mayor ratio de solvencia sintético (**222,51 %**).

> **Nota:** Estos resultados corresponden exclusivamente al dataset sintético utilizado con fines educativos y no representan el desempeño real de compañías del mercado chileno.

### 📚 Documentación

📄 [Metodología y resultados SQL](documentacion/metodologia_sql.md)

📂 [Scripts SQL](sql)

---

# 📐 Fase 4 — Catálogo y validación de KPIs

Antes de desarrollar el dashboard se definió un catálogo formal de indicadores para asegurar que todas las métricas utilizaran fórmulas, unidades y reglas de agregación consistentes.

### ✔ Resultados obtenidos

- Definición de 12 KPIs principales.
- Clasificación de medidas aditivas, semi-aditivas y no aditivas.
- Documentación de fórmulas e interpretación de cada KPI.
- Validación completa mediante SQL.
- Valores de referencia establecidos para el período **2025-T4**.
- Exclusión del ROE del conjunto principal debido a la limitación DQ-01.

### 📊 KPIs definidos

- Prima directa
- Participación de mercado
- Crecimiento QoQ
- Crecimiento YoY
- Tasa de siniestralidad
- Ratio de gastos
- Resultado técnico
- Margen técnico
- Resultado neto
- Ratio de solvencia sintético
- Asegurados vigentes
- Crecimiento YoY de asegurados

### ✔ Valores de referencia validados (2025-T4)

| Indicador | Valor |
|-----------|-------:|
| Prima directa | 2.435.934 MM CLP |
| Crecimiento QoQ | 4,77 % |
| Crecimiento YoY | 4,29 % |
| Siniestralidad ponderada | 55,70 % |
| Ratio de gastos | 12,79 % |
| Margen técnico | 31,51 % |
| Ratio de solvencia sintético | 180,48 % |
| Asegurados vigentes | 9.134.304 |

Estos valores servirán como referencia para comprobar que el modelo de Power BI reproduzca exactamente los resultados obtenidos en SQL.

### 📚 Documentación

📘 [Diccionario de KPIs](documentacion/diccionario_kpis.md)

---

### 🧱 Modelo dimensional en Power BI - Fase 5

Se construyó y validó el modelo analítico en Power BI, utilizando como fuente los datos previamente procesados y validados en MySQL. El objetivo de esta fase fue transformar la estructura tabular original en un modelo dimensional tipo estrella, preparado para el posterior desarrollo del dashboard ejecutivo. (Power BI, Power Query, MySQL, DAX)

🧱 Modelo dimensional

El modelo quedó compuesto por tres dimensiones y dos tablas de hechos:

D_Fecha: dimensión calendario diaria con 1.096 registros, desde 2023-01-01 hasta 2025-12-31. (Power BI, DAX)
D_Compania: 12 aseguradoras ficticias y sus atributos descriptivos. (Power BI, Power Query)
D_Producto: 5 categorías de productos de seguros de vida. (Power BI)
H_Mercado_Trimestral: 144 registros y 21 columnas, con granularidad compañía-trimestre. (Power BI, Power Query)
H_Primas_Producto: 720 registros y 4 columnas, con granularidad compañía-trimestre-producto. (Power BI, Power Query)

La separación en dos tablas de hechos permite analizar las primas por producto sin duplicar métricas como siniestros, gastos, capital, patrimonio o asegurados. 

🔗 Relaciones

Se configuraron cinco relaciones activas 1:* con filtrado unidireccional desde las dimensiones hacia las tablas de hechos. 

Se creó una página específica de validación para comprobar la propagación de filtros y reconciliar los resultados de Power BI contra los controles previamente obtenidos en SQL.

Para 2025-T4 se verificaron:

Control	Resultado
Prima directa	2.435.934 MM CLP
Prima por producto	2.435.937 MM CLP
Diferencia documentada	3 MM CLP

La diferencia corresponde al redondeo de las primas sintéticas distribuidas entre los cinco productos y no fue corregida artificialmente. 

Las pruebas confirmaron además que:

Fecha filtra correctamente ambas tablas de hechos.
Compañía filtra correctamente ambas tablas de hechos.
Producto modifica únicamente las primas por producto.
No aparecen categorías en blanco asociadas a claves sin correspondencia.
Las relaciones mantienen la cardinalidad y dirección esperadas.

🖥️ [Vista previa del modelo analítico](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/imagenes/modelo_analitico_preview.png)

🎬 Demostración 

https://github.com/user-attachments/assets/b0db048f-2ede-4c91-8b26-fd5c17052c6f

El archivo .pbix se encuentra disponible para una revisión técnica del modelo

➡️ Abrir archivos de Power BI

## 🧰 Tecnologías

### Utilizadas hasta ahora

- GitHub
- Markdown
- Microsoft Excel
- Power Query
- SQL
- Microsoft Power BI
- DAX

---

## 🗂️ Estructura actual del repositorio

<img width="782" height="621" alt="image" src="https://github.com/user-attachments/assets/bd0722d0-5299-409c-8d01-a821351a7d06" />





