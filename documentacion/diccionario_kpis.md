# 📐 Diccionario de KPIs — Fase 4

**Proyecto:** Análisis del Mercado Chileno de Seguros de Vida  
**Período:** 2023-T1 a 2025-T4  
**Granularidad fuente:** una compañía ficticia por trimestre  
**Estado:** validado e implementado

## 1. Principios de diseño

- Los montos y conteos deben conservar su unidad original.
- Los ratios no deben sumarse ni promediarse directamente cuando existen numeradores y denominadores disponibles.
- Los stocks trimestrales se muestran para un período concreto y no deben sumarse a través del tiempo.
- Las comparaciones QoQ y YoY requieren una secuencia temporal completa.
- Los resultados describen únicamente el dataset sintético.
- El ROE queda fuera del conjunto principal de KPIs por la limitación DQ-01.

## 2. Clasificación de medidas

### Medidas aditivas

Pueden sumarse entre compañías y, cuando representan flujos del período, también entre períodos:

- Prima directa.
- Prima retenida neta.
- Costo de siniestros.
- Gastos de administración.
- Resultado técnico.
- Resultado neto.
- Nuevos asegurados.
- Cancelaciones.

### Medidas semi-aditivas

Pueden sumarse entre compañías dentro del mismo trimestre, pero no a través de varios trimestres:

- Pólizas vigentes.
- Asegurados vigentes.
- Reservas técnicas.
- Activos.
- Pasivos.
- Patrimonio.
- Capital disponible.
- Capital requerido.

### Medidas no aditivas

Deben recalcularse según el contexto de filtros:

- Participación de mercado.
- Crecimiento QoQ.
- Crecimiento YoY.
- Siniestralidad.
- Ratio de gastos.
- Margen técnico.
- Ratio de solvencia sintético.
- Participación del mix de productos.

---

## 3. KPIs principales

## KPI-01 — Prima directa

**Pregunta:** ¿Cuál es el volumen de ventas de seguros del período?

**Fórmula:**

```text
SUM(prima_directa_millones_clp)
```

**Unidad:** millones de CLP  
**Frecuencia:** trimestral  
**Agregación:** aditiva  
**Dirección favorable:** depende del contexto; un mayor valor indica más volumen, pero no necesariamente mayor rentabilidad.  
**Visual recomendada:** tarjeta y línea temporal.  
**Limitación:** corresponde a un escenario sintético.

---

## KPI-02 — Participación de mercado

**Pregunta:** ¿Qué proporción de la prima directa del mercado corresponde a una compañía?

**Fórmula:**

```text
Prima directa de la compañía
───────────────────────────── × 100
Prima directa total del mercado
```

**Unidad:** porcentaje  
**Frecuencia:** trimestral  
**Agregación:** no aditiva  
**Dirección favorable:** un aumento representa mayor peso relativo, pero no garantiza eficiencia o rentabilidad.  
**Visual recomendada:** barras ordenadas, participación por compañía y evolución temporal.  
**Regla:** el denominador debe conservar el filtro temporal y eliminar solamente el filtro de compañía.  
**Tolerancia:** la suma puede encontrarse entre 99,99% y 100,02% por redondeo.

---

## KPI-03 — Crecimiento trimestral de prima directa (QoQ)

**Pregunta:** ¿Cuánto cambió la prima directa frente al trimestre inmediatamente anterior?

**Fórmula:**

```text
Prima actual - Prima trimestre anterior
──────────────────────────────────────── × 100
Prima trimestre anterior
```

**Unidad:** porcentaje  
**Frecuencia:** trimestral  
**Agregación:** no aditiva  
**Dirección favorable:** positiva, interpretada junto con estacionalidad.  
**Visual recomendada:** línea, columnas con variación o tarjeta con flecha.  
**Limitación:** el primer trimestre disponible de cada serie no tiene comparación y debe devolver vacío.

---

## KPI-04 — Crecimiento interanual de prima directa (YoY)

**Pregunta:** ¿Cuánto cambió la prima directa frente al mismo trimestre del año anterior?

**Fórmula:**

```text
Prima actual - Prima mismo trimestre año anterior
────────────────────────────────────────────────── × 100
Prima mismo trimestre año anterior
```

**Unidad:** porcentaje  
**Frecuencia:** trimestral  
**Agregación:** no aditiva  
**Dirección favorable:** positiva.  
**Visual recomendada:** línea temporal, tarjeta o tabla de compañías.  
**Limitación:** los primeros cuatro trimestres de cada serie deben devolver vacío.

---

## KPI-05 — Tasa de siniestralidad ponderada

**Pregunta:** ¿Qué proporción de la prima retenida es absorbida por el costo de siniestros?

**Fórmula:**

```text
SUM(costo_siniestros_millones_clp)
────────────────────────────────── × 100
SUM(prima_retenida_neta_millones_clp)
```

**Unidad:** porcentaje  
**Frecuencia:** trimestral o período acumulado  
**Agregación:** no aditiva  
**Dirección favorable:** generalmente menor, pero un valor bajo debe interpretarse junto con volumen, producto y cobertura.  
**Visual recomendada:** tarjeta, línea y dispersión frente a margen técnico.  
**Regla:** no utilizar `AVG(tasa_siniestralidad_pct)` para períodos acumulados.

---

## KPI-06 — Ratio de gastos

**Pregunta:** ¿Qué proporción de la prima retenida se destina a gastos administrativos?

**Fórmula:**

```text
SUM(gastos_administracion_millones_clp)
─────────────────────────────────────── × 100
SUM(prima_retenida_neta_millones_clp)
```

**Unidad:** porcentaje  
**Frecuencia:** trimestral o período acumulado  
**Agregación:** no aditiva  
**Dirección favorable:** generalmente menor.  
**Visual recomendada:** tarjeta, línea y comparación por compañía.  
**Regla:** no promediar porcentajes trimestrales directamente.

---

## KPI-07 — Resultado técnico

**Pregunta:** ¿Cuál es el resultado generado por la operación aseguradora simplificada?

**Fórmula del dataset:**

```text
Prima retenida neta
- Costo de siniestros
- Gastos administrativos
```

**Unidad:** millones de CLP  
**Frecuencia:** trimestral o período acumulado  
**Agregación:** aditiva  
**Dirección favorable:** positiva y creciente.  
**Visual recomendada:** tarjeta, línea y ranking por compañía.  
**Limitación:** fórmula educativa simplificada; no representa el resultado técnico contable o regulatorio oficial.

---

## KPI-08 — Margen técnico

**Pregunta:** ¿Qué proporción de la prima retenida se convierte en resultado técnico?

**Fórmula:**

```text
SUM(resultado_tecnico_millones_clp)
─────────────────────────────────── × 100
SUM(prima_retenida_neta_millones_clp)
```

**Unidad:** porcentaje  
**Frecuencia:** trimestral o período acumulado  
**Agregación:** no aditiva  
**Dirección favorable:** mayor.  
**Visual recomendada:** tarjeta, barras o dispersión frente a siniestralidad.  
**Limitación:** hereda la simplificación del resultado técnico.

---

## KPI-09 — Resultado neto

**Pregunta:** ¿Cuál es el resultado final simplificado después de inversiones y otros componentes del modelo?

**Fórmula:**

```text
SUM(resultado_neto_millones_clp)
```

**Unidad:** millones de CLP  
**Frecuencia:** trimestral o período acumulado  
**Agregación:** aditiva  
**Dirección favorable:** positiva.  
**Visual recomendada:** tarjeta, línea y ranking.  
**Limitación:** corresponde al modelo sintético y no a estados financieros reales.

---

## KPI-10 — Ratio de solvencia sintético

**Pregunta:** ¿Cuántas veces el capital disponible cubre el capital requerido del modelo?

**Fórmula:**

```text
SUM(capital_disponible_millones_clp)
──────────────────────────────────── × 100
SUM(capital_requerido_millones_clp)
```

**Unidad:** porcentaje  
**Frecuencia:** trimestral  
**Agregación:** no aditiva  
**Dirección favorable:** mayor, dentro de la lógica sintética.  
**Visual recomendada:** tarjeta y ranking por compañía.  
**Regla:** debe evaluarse para un período específico; no promediar los ratios almacenados.  
**Limitación:** no reproduce la holgura patrimonial ni otro cálculo regulatorio oficial de la CMF.

---

## KPI-11 — Asegurados vigentes

**Pregunta:** ¿Cuál es el tamaño de la cartera asegurada al cierre del trimestre?

**Fórmula:**

```text
SUM(asegurados_vigentes)
```

**Unidad:** personas aseguradas  
**Frecuencia:** trimestral  
**Agregación:** semi-aditiva  
**Dirección favorable:** generalmente mayor, pero debe interpretarse junto con primas, cancelaciones y rentabilidad.  
**Visual recomendada:** tarjeta y línea temporal.  
**Regla:** puede sumarse entre compañías en un mismo trimestre, pero no entre trimestres.

---

## KPI-12 — Crecimiento interanual de asegurados

**Pregunta:** ¿Cuánto cambió la cartera asegurada frente al mismo trimestre del año anterior?

**Fórmula:**

```text
Asegurados actuales - Asegurados mismo trimestre año anterior
───────────────────────────────────────────────────────────── × 100
Asegurados mismo trimestre año anterior
```

**Unidad:** porcentaje  
**Frecuencia:** trimestral  
**Agregación:** no aditiva  
**Dirección favorable:** positiva.  
**Visual recomendada:** línea y ranking por compañía.  
**Limitación:** no equivale automáticamente a retención o churn.

---

## 4. Medidas de apoyo

### M-01 — Prima retenida neta

```text
SUM(prima_retenida_neta_millones_clp)
```

Base para siniestralidad, gastos y margen técnico.

### M-02 — Pólizas vigentes

```text
SUM(polizas_vigentes)
```

Medida semi-aditiva: se muestra para un trimestre determinado.

### M-03 — Saldo neto de cartera

```text
SUM(nuevos_asegurados) - SUM(cancelaciones)
```

Medida exploratoria de flujo. No debe llamarse retención o churn.

### M-04 — Participación del mix de productos

```text
Prima del producto
────────────────── × 100
Prima directa total
```

No aditiva. Se utilizará después de transformar las columnas de producto a una estructura vertical.

### M-05 — Capital disponible y capital requerido

Medidas base para el ratio de solvencia sintético.

---

## 5. KPI excluido del conjunto principal

## ROE anualizado

`roe_anualizado_pct` queda fuera de las tarjetas, rankings y comparaciones principales.

**Motivo:** el campo se encuentra entre 57,12% y 133,33% y todas las observaciones son positivas. La aritmética interna es consistente, pero la distribución no representa adecuadamente la heterogeneidad esperable del mercado.

**Uso permitido:** ejemplo de limitación de plausibilidad en datos sintéticos.  
**Uso no permitido:** benchmark contra compañías reales o KPI ejecutivo principal.

---

## 6. Valores de referencia del período 2025-T4

| KPI | Valor esperado |
|---|---:|
| Prima directa total | 2.435.934 MM CLP |
| Crecimiento QoQ de prima | 4,77% |
| Crecimiento YoY de prima | 4,29% |
| Prima retenida neta | 2.336.531 MM CLP |
| Tasa de siniestralidad ponderada | 55,70% |
| Ratio de gastos | 12,79% |
| Resultado técnico | 736.330 MM CLP |
| Margen técnico | 31,51% |
| Resultado neto | 768.696 MM CLP |
| Ratio de solvencia sintético | 180,48% |
| Pólizas vigentes | 7.828.045 |
| Asegurados vigentes | 9.134.304 |
| Nuevos asegurados | 292.967 |
| Cancelaciones | 157.660 |
| Saldo neto de cartera | 135.307 |

Estos valores se utilizarán para validar la futura implementación en Power BI.

