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

## Decisiones de limpieza recomendadas

1. Mantener intacto el archivo original dentro de `datos/raw/`.
2. Importar el CSV mediante Power Query y tipar explícitamente cada columna.
3. Convertir `fecha_cierre` a tipo **Fecha**.
4. Mantener `periodo` como texto.
5. Validar `compania_id + periodo` como clave lógica de la tabla.
6. No corregir diferencias pequeñas de redondeo en primas, balance o participación de mercado.
7. Documentar las tolerancias de redondeo.
8. Revisar la construcción de `roe_anualizado_pct` antes de usarlo como KPI destacado.
9. Generar una salida procesada solo después de documentar todas las transformaciones.

## Nota de trazabilidad

No se deben sobrescribir los datos originales durante la limpieza. Las transformaciones deben quedar registradas como pasos reproducibles en Power Query y la salida debe guardarse separadamente en `datos/processed/`.
