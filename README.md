# 🛡️ Análisis del Mercado Chileno de Seguros de Vida

> 📊 Proyecto de Business Intelligence con datos sintéticos, inspirado en conceptos e indicadores del mercado asegurador chileno.

**Estado:** 🟡 En desarrollo - Fase 7 completada  
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
- ✅ **Fase 6:** Desarrollo del dashboard ejecutivo.
- ✅ **Fase 7:** Análisis de resultados, insights y recomendaciones.
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
- Pacífico Futuro Vida obtuvo el mayor margen técnico acumulado del período analizado (**39,73 %**).
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

# 🧱 Fase 5 - Modelo dimensional en Power BI 

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

| Control | Resultado |
|---|---:|
| Prima directa | 2.435.934 MM CLP |
| Prima por producto | 2.435.937 MM CLP |
| Diferencia de redondeo | 3 MM CLP |

La diferencia corresponde al redondeo de las primas sintéticas distribuidas entre los cinco productos y no fue corregida artificialmente. 

Las pruebas confirmaron además que:

Fecha filtra correctamente ambas tablas de hechos.
Compañía filtra correctamente ambas tablas de hechos.
Producto modifica únicamente las primas por producto.
No aparecen categorías en blanco asociadas a claves sin correspondencia.
Las relaciones mantienen la cardinalidad y dirección esperadas.

🖥️ Preview del modelo analítico
[![Vista previa del modelo analítico](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/imagenes/modelo_analitico_preview.png)

🎬 Demostración 

https://github.com/user-attachments/assets/92daa5f1-a666-44ee-9a20-32f2051bdc6f

El archivo .pbix se encuentra disponible para una revisión técnica del modelo

➡️ [Abrir archivos de Power BI](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/Power%20BI/modelo_analitico_seguros_vida_chile.pbix)

---

# 📊 Fase 6 — Dashboard ejecutivo en Power BI

Sobre el modelo dimensional validado en la Fase 5 se construyó la capa analítica DAX y un dashboard ejecutivo de cuatro páginas, diseñado para responder las preguntas de negocio definidas al inicio del proyecto.

### ✔ Resultados de construcción

- **29 medidas DAX explícitas**: 15 medidas base, 6 KPIs derivados, 6 medidas de inteligencia temporal y 2 medidas de apoyo competitivo.
- **4 páginas ejecutivas**: Resumen Ejecutivo, Mercado y Competencia, Desempeño Técnico, y Productos y Cartera.
- Comparaciones **QoQ** y **YoY** mediante una dimensión calendario validada.
- Ratios recalculados desde sus componentes, evitando promediar porcentajes almacenados.
- Tratamiento de pólizas, asegurados y capital como **stocks de cierre**.
- Reconciliación de los KPIs de Power BI contra los controles previamente obtenidos en SQL.

### 📌 Controles principales — 2025-T4

| Indicador | Resultado |
|---|---:|
| Prima directa | **2.435.934 MM CLP** |
| Crecimiento QoQ | **4,77 %** |
| Crecimiento YoY | **4,29 %** |
| Siniestralidad | **55,70 %** |
| Ratio de gastos | **12,79 %** |
| Resultado técnico | **736.330 MM CLP** |
| Margen técnico | **31,51 %** |
| Solvencia sintética | **180,48 %** |
| Asegurados vigentes | **9.134.304** |
| Crecimiento YoY asegurados | **-3,83 %** |
| Nuevos asegurados | **292.967** |
| Cancelaciones | **157.660** |
| Saldo neto de cartera | **135.307** |

### 🧭 Páginas del dashboard

**Resumen Ejecutivo**  
Visión consolidada del mercado: primas, crecimiento, asegurados, siniestralidad, margen, solvencia, liderazgo y mix de productos.

**Mercado y Competencia**  
Ranking de las 12 compañías ficticias, concentración Top 5 y posicionamiento por participación, crecimiento y escala de asegurados.

**Desempeño Técnico**  
Seguimiento de siniestralidad, gastos, resultado técnico, margen y solvencia sintética, junto con benchmarks de compañías.

**Productos y Cartera**  
Composición de primas por producto, evolución de asegurados y pólizas, altas, cancelaciones y saldo neto de cartera.

### 🖥️ Previews y demostraciones

Cada imagen abre la demostración correspondiente del dashboard.

| Resumen Ejecutivo | Mercado y Competencia |
|---|---|
| [![Resumen Ejecutivo](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/imagenes/dashboard_resumen_ejecutivo_preview.png) | [![Mercado y Competencia](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/imagenes/dashboard_mercado_competencia_preview.png) |

| Desempeño Técnico | Productos y Cartera |
|---|---|
| [![Desempeño Técnico](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/imagenes/dashboard_desempeno_tecnico_preview.png) | [![Productos y Cartera](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/imagenes/dashboard_productos_cartera_preview.png) |

🎬 Demostración 

https://github.com/user-attachments/assets/c7f8671e-7e81-4999-b195-7c400ab00b18

https://github.com/user-attachments/assets/4289e1bf-3b1b-4aec-af65-4fddc7d69d92

https://github.com/user-attachments/assets/8e990bac-30ce-4f89-869c-bdfc62ebf307

https://github.com/user-attachments/assets/00bcf0c9-f6b9-4098-b3dc-d7abf444b902

> Los previews permiten revisar el diseño sin Power BI Desktop; las demostraciones muestran filtros e interacciones. El archivo `.pbix` se mantiene disponible para inspección técnica.

### 🔍 Consideraciones metodológicas

- Todos los datos y compañías son **sintéticos**.
- La **solvencia sintética** es un indicador educativo y no reproduce la metodología regulatoria oficial de la CMF.
- `Saldo Neto Cartera = Nuevos Asegurados - Cancelaciones`; no equivale automáticamente a churn, retención o renovación.
- En el dataset sintético, el resultado técnico se deriva de prima retenida, siniestros y gastos; por ello, la relación entre siniestralidad, ratio de gastos y margen técnico es parcialmente mecánica.
- La diferencia entre prima directa y suma de primas por producto corresponde a redondeos del dataset sintético y se mantiene documentada.

### 📚 Documentación y archivos

- 📐 [Medidas DAX y metodología](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/Power%20BI/medidas_dax.md)
- 🎨 [Diseño del dashboard ejecutivo](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/Power%20BI/diseño_dashboard_ejecutivo.md)

---

## 💡 Fase 7 — Hallazgos y recomendaciones

El análisis final permitió convertir los KPIs y dashboards validados en una lectura ejecutiva del escenario sintético.

### Hallazgos principales

- 📈 **Crecimiento con contexto temporal:** la prima directa aumentó **26,50%** entre 2023-T1 y 2025-T4; las caídas QoQ observadas en T1 muestran por qué el YoY es necesario para interpretar la tendencia estructural.
- 🏢 **Presión competitiva:** VidaGlobal conserva el liderazgo, pero su brecha frente a Horizonte se redujo de **4,38 pp a 3,12 pp**; Horizonte y NovaProtección crecen por encima del mercado.
- 👥 **Divergencia comercial:** en 2025-T4 la prima crece **+4,29% YoY**, mientras los asegurados vigentes caen **-3,83%**.
- ⚙️ **Desempeño multidimensional:** el margen técnico mejora mientras la solvencia sintética disminuye, por lo que ambos deben analizarse por separado.
- 📦 **Mix estable:** Vida y Protección + Rentas Vitalicias explican **69,72%** del crecimiento absoluto YoY de primas por producto sin una gran rotación del mix.

### Recomendaciones

1. Monitorear competidores mediante participación, cambio de share y crecimiento YoY.
2. Profundizar la divergencia entre primas y asegurados con datos de prima promedio, renovación y persistencia.
3. Mantener separados los indicadores de eficiencia técnica y solvencia/capital.
4. Analizar en mayor profundidad los motores de Vida y Protección y Rentas Vitalicias.
5. Incorporar conciliación stock-flujo de cartera como control obligatorio de calidad de datos.

📄 [Ver hallazgos y recomendaciones completos](https://github.com/JuanIgnacioPal/analisis-mercado-seguros-vida-chile/blob/main/documentacion/hallazgos_y_recomendaciones.md#-fase-7--hallazgos-y-recomendaciones-ejecutivas)

## 🧰 Herramientas Utilizadas 

- GitHub
- Markdown
- Microsoft Excel
- Power Query
- SQL
- Microsoft Power BI
- DAX

---

## 🗂️ Estructura actual del repositorio

<img width="906" height="741" alt="image" src="https://github.com/user-attachments/assets/3ceff545-6515-412d-be8f-2788280db893" />







