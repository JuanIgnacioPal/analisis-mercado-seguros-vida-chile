# 🔎 Auditoría de calidad de datos - Fase 2

**Proyecto:** Análisis del Mercado Chileno de Seguros de Vida  
**Archivo auditado:** `mercado_asegurador_vida_chile_sintetico.csv`  
**Filas:** 144  
**Columnas:** 39  
**Granularidad:** una fila por compañía y trimestre

## Resultado general

El dataset presenta una estructura técnica limpia: no se detectaron valores nulos, filas duplicadas, claves compañía-período duplicadas ni incoherencias entre año, trimestre, período y fecha de cierre.

Sin embargo, se detectó una observación de **plausibilidad de negocio** que debe resolverse o documentarse antes de utilizar el ROE como KPI principal: `roe_anualizado_pct` se encuentra entre **57.12% y 133.33%**, y todas las observaciones son positivas. Al tratarse de datos sintéticos, esto no es un error de integridad, pero sí una señal de que la relación entre resultado neto y patrimonio debe revisarse para que el dataset represente mejor la heterogeneidad del mercado real.

## Controles ejecutados

| Control | Resultado |
|---|---|
| Valores nulos | 0 |
| Filas duplicadas | 0 |
| Duplicados en `compania_id + periodo` | 0 |
| Compañías | 12 |
| Períodos | 12 |
| Años | 2023, 2024, 2025 |
| Trimestres | 1, 2, 3, 4 |
| Fechas no interpretables | 0 |
| Inconsistencias fecha/año | 0 |
| Inconsistencias fecha/trimestre | 0 |
| Inconsistencias `periodo` vs año/trimestre | 0 |
| Valores negativos en variables numéricas | 0 |

## Controles de coherencia

- **Mix de primas:** la suma de las cinco primas por producto difiere de la prima directa en un máximo de **2 millones de CLP** por fila. La diferencia es compatible con redondeos del dataset sintético.
- **Ecuación contable simplificada:** `activos = pasivos + patrimonio` presenta una diferencia máxima de **1 millón de CLP**, atribuible al redondeo.
- **Participación de mercado:** la suma por trimestre se encuentra entre **99.99% y 100.02%**, compatible con redondeo a dos decimales.
- **Tasa de siniestralidad:** la diferencia máxima entre el valor almacenado y el recálculo es inferior a **0.005 puntos porcentuales**.
- **Ratio de gastos:** la diferencia máxima entre el valor almacenado y el recálculo es inferior a **0.005 puntos porcentuales**.
- **Ratio de solvencia:** la diferencia máxima entre el valor almacenado y el recálculo es inferior a **0.007 puntos porcentuales**.

---

## 🔄 Hallazgos de calidad posteriores

Durante las fases posteriores del proyecto se realizaron controles
adicionales derivados del análisis en SQL y Power BI.

Estos controles complementan la auditoría inicial de la Fase 2 y
documentan limitaciones detectadas durante el análisis.

---
      
## ⚠️ Limitación posterior — No conciliación stock-flujo de cartera sd

**Fecha de detección:** Fase 7 — análisis de resultados.

### Control 2025

| Métrica | Resultado |
|---|---:|
| Nuevos asegurados | 1.165.912 |
| Cancelaciones | 673.317 |
| Nuevos - Cancelaciones | +492.595 |
| Cambio stock 2024-T4 → 2025-T4 | -363.754 |
| Diferencia no conciliada | **-856.349** |

### Evaluación

Las variables de flujo disponibles no explican el cambio del stock de asegurados. El dataset sintético probablemente omite otros movimientos o genera stocks y flujos de manera parcialmente independiente.

### Decisión analítica

- Conservar `Saldo Neto Cartera` como indicador descriptivo de altas menos cancelaciones.
- No utilizarlo para explicar la variación del stock de asegurados.
- No interpretarlo como churn, retención o renovación.
- No modificar retrospectivamente el dataset para forzar la conciliación.

### Recomendación para datos reales

Aplicar una regla auditable:

```text
Stock final = Stock inicial + Altas - Bajas ± Otros movimientos identificados
```

El conjunto de movimientos debe estar definido al nivel de cliente/póliza correspondiente antes de construir KPIs de persistencia o retención.


