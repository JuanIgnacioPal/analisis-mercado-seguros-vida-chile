# Metodología SQL — Fase 3

## 1. Objetivo

Preparar el dataset sintético del mercado chileno de seguros de vida en MySQL 8.0, reproducir los controles de calidad de la Fase 2 y construir consultas que respondan preguntas empresariales sobre crecimiento, participación, eficiencia, resultados técnicos, solvencia y composición del negocio.

## 2. Entorno técnico

- **Motor:** MySQL 8.0
- **Cliente:** MySQL Workbench 8.0 CE
- **Base de datos:** `seguros_vida_chile`
- **Tabla principal:** `mercado_asegurador_vida`
- **Granularidad:** una compañía ficticia por trimestre
- **Clave primaria:** `compania_id + periodo`

## 3. Flujo de trabajo

```text
CSV raw
   ↓
Creación de esquema y tabla
   ↓
Importación con Table Data Import Wizard
   ↓
Validación de calidad en SQL
   ↓
Análisis descriptivo
   ↓
Cálculos QoQ y YoY
   ↓
Rankings y KPIs
```

## 4. Creación del modelo relacional

El archivo `Fase_01_creacion_base_tabla.sql` crea una tabla de 39 columnas con tipos definidos explícitamente.

Se utilizaron:

- `DATE` para `fecha_cierre`.
- `SMALLINT` y `TINYINT` para año y trimestre.
- `CHAR` y `VARCHAR` para identificadores y atributos descriptivos.
- `BIGINT` para montos expresados en millones de CLP.
- `INT UNSIGNED` para conteos de pólizas, asegurados y siniestros.
- `DECIMAL` para porcentajes y costos promedio.

La clave primaria compuesta impide que una compañía tenga más de una observación para el mismo período.

## 5. Validación de calidad en SQL

El archivo `Fase_02_validacion_calidad.sql` confirmó:

| Control | Resultado |
|---|---:|
| Registros | 144 |
| Variables | 39 |
| Compañías | 12 |
| Períodos | 12 |
| Valores nulos | 0 |
| Duplicados en la clave lógica | 0 |
| Inconsistencias temporales | 0 |
| Compañías con períodos incompletos | 0 |
| Diferencia máxima en composición de primas | 2 MM CLP |
| Diferencia máxima en balance simplificado | 1 MM CLP |
| Participación agregada por trimestre | Aproximadamente 100% |
| Diferencias máximas en KPIs recalculados | Menores a 0,01 pp |

Los resultados coinciden con la auditoría realizada previamente en Power Query.

## 6. Análisis descriptivo

El archivo `Fase_03_analisis_mercado.sql` respondió seis grupos de preguntas.

### 6.1 Evolución del mercado

La prima directa total del escenario sintético aumentó desde **1.925.566 MM CLP en 2023-T1** hasta **2.435.934 MM CLP en 2025-T4**.

Esto equivale a un aumento aproximado de **26,50%** entre ambos puntos.

### 6.2 Prima directa acumulada

Las tres compañías ficticias con mayor prima directa acumulada fueron:

1. VidaGlobal Chile S.A.: **4.532.120 MM CLP**
2. Horizonte Vida Chile S.A.: **3.621.553 MM CLP**
3. NovaProtección Vida S.A.: **2.994.699 MM CLP**

### 6.3 Participación de mercado en 2025-T4

1. VidaGlobal Chile S.A.: **17,32%**
2. Horizonte Vida Chile S.A.: **14,20%**
3. NovaProtección Vida S.A.: **12,29%**

### 6.4 Resultado y margen técnico

VidaGlobal presentó el mayor resultado técnico acumulado, con **1.264.817 MM CLP**.

Sin embargo, Pacífico Futuro Vida presentó el mayor margen técnico porcentual, con **39,73%**.

Esto demuestra que un mayor resultado absoluto no implica necesariamente una mayor eficiencia relativa.

### 6.5 Mix sintético de productos

| Producto | Participación |
|---|---:|
| Rentas Vitalicias | 29,76% |
| Vida y Protección | 28,56% |
| Ahorro / APV | 20,41% |
| Salud | 12,84% |
| Accidentes Personales | 8,42% |

### 6.6 Origen del capital

Dentro del dataset sintético, el grupo multinacional acumuló un volumen superior de prima directa, mientras que el grupo local presentó una menor siniestralidad ponderada.

Esta comparación describe únicamente el escenario ficticio y no debe extrapolarse al mercado asegurador real.

## 7. Crecimiento temporal

El archivo `Fase_04_crecimiento.sql` utiliza `LAG()` para calcular:

- crecimiento trimestral o QoQ;
- crecimiento interanual o YoY;
- crecimiento de la prima total del mercado;
- crecimiento interanual de asegurados vigentes.

### 7.1 Resultado metodológico relevante

En `2025-T1`, el mercado sintético presentó:

- **QoQ:** -10,53%
- **YoY:** +5,69%

No existe contradicción: el trimestre disminuye frente a `2024-T4`, pero aumenta frente a `2024-T1`.

### 7.2 Valores NULL esperados

- Q1 presenta 12 valores QoQ nulos: el primer trimestre de cada compañía no tiene observación anterior.
- Q2 y Q4 presentan 48 valores YoY nulos: los primeros cuatro trimestres de cada compañía no tienen comparación interanual.

Los valores nulos son consecuencia de la ventana temporal disponible y no errores de calidad.

## 8. Rankings y KPIs

El archivo `Fase_05_rankings_kpis.sql` utiliza `RANK() OVER()`.

### 8.1 Participación de mercado

VidaGlobal Chile ocupa la primera posición en 2025-T4 con **17,32%**.

### 8.2 Crecimiento interanual

Horizonte Vida ocupa la primera posición en 2025-T4 con **10,83%**.

### 8.3 Margen técnico

Pacífico Futuro Vida ocupa la primera posición con **39,73%**.

### 8.4 Solvencia sintética

AndesCare Vida ocupa la primera posición en 2025-T4 con **222,51%**.

Este indicador es una simplificación educativa y no reproduce el cálculo regulatorio oficial de la CMF.

### 8.5 Siniestralidad y gastos

La consulta R5 ordena las compañías por siniestralidad y luego por gastos. No constituye un índice compuesto porque no se definieron ponderaciones empresariales entre ambos indicadores.

## 9. Decisiones metodológicas

### Ratios ponderados

Para períodos acumulados, los ratios se recalcularon como:

```text
SUM(numerador) / SUM(denominador)
```

No se utilizó el promedio simple de porcentajes trimestrales porque los períodos manejan distintos volúmenes de primas.

### Uso del ROE

El ROE se excluyó de los rankings principales debido a la limitación DQ-01 documentada en la Fase 2.

### Alcance de las conclusiones

Los resultados son descriptivos y corresponden exclusivamente al dataset sintético.

No permiten:

- inferir causalidad;
- evaluar compañías reales;
- reproducir cálculos actuariales o regulatorios oficiales;
- extrapolar los resultados al mercado chileno real.

## 10. Competencias demostradas

- Diseño de esquema relacional.
- Definición de tipos y restricciones.
- Importación y validación de datos.
- Consultas agregadas.
- Recalculo de KPIs ponderados.
- Subconsultas y operaciones de conjuntos.
- CTE.
- Funciones de ventana.
- Análisis temporal QoQ y YoY.
- Rankings empresariales.
- Documentación de limitaciones analíticas.

## 11. Estado

**Fase 3 — Preparación y análisis en SQL: COMPLETADA**
