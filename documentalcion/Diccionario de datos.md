# 📘 Diccionario de datos

**Proyecto:** Análisis del Mercado Chileno de Seguros de Vida  
**Dataset:** `mercado_asegurador_vida_chile_sintetico.csv`  
**Granularidad:** una fila por compañía y trimestre.  
**Unidad monetaria:** millones de pesos chilenos (CLP), salvo variables de conteo o porcentaje.

> El dataset es 100% sintético. Las definiciones buscan representar conceptos habituales del análisis asegurador, pero no sustituyen definiciones regulatorias, contables o actuariales oficiales.

| Campo | Tipo recomendado | Descripción |
|---|---|---|
| `periodo` | Texto | Período trimestral de la observación, expresado como AAAA-Tn. |
| `fecha_cierre` | Fecha | Fecha de cierre del trimestre correspondiente a la observación. |
| `anio` | Número entero | Año calendario de la observación. |
| `trimestre` | Número entero | Número de trimestre del año (1 a 4). |
| `compania_id` | Texto | Identificador sintético único de la compañía aseguradora. |
| `compania` | Texto | Nombre ficticio de la compañía aseguradora. |
| `origen_capital` | Texto | Clasificación sintética del origen del capital de la compañía: Local o Multinacional. |
| `segmento` | Texto | Segmento asegurador analizado. En este dataset: Seguros de Vida. |
| `perfil_negocio` | Texto | Descripción sintética de la orientación principal del negocio de la compañía. |
| `prima_directa_millones_clp` | Número entero | Monto total de prima directa del período, expresado en millones de CLP. |
| `prima_retenida_neta_millones_clp` | Número entero | Prima retenida por la compañía después del efecto simplificado de reaseguro, en millones de CLP. |
| `prima_vida_proteccion_millones_clp` | Número entero | Parte de la prima directa asociada a productos de vida y protección, en millones de CLP. |
| `prima_salud_millones_clp` | Número entero | Parte de la prima directa asociada a productos de salud, en millones de CLP. |
| `prima_ahorro_apv_millones_clp` | Número entero | Parte de la prima directa asociada a productos de ahorro/APV, en millones de CLP. |
| `prima_rentas_vitalicias_millones_clp` | Número entero | Parte de la prima directa asociada a rentas vitalicias, en millones de CLP. |
| `prima_accidentes_personales_millones_clp` | Número entero | Parte de la prima directa asociada a accidentes personales, en millones de CLP. |
| `siniestros_pagados_millones_clp` | Número entero | Monto de siniestros efectivamente pagados durante el período, en millones de CLP. |
| `costo_siniestros_millones_clp` | Número entero | Costo total simplificado de siniestros reconocido durante el período, en millones de CLP. |
| `gastos_administracion_millones_clp` | Número entero | Gastos administrativos simplificados del período, en millones de CLP. |
| `resultado_inversiones_millones_clp` | Número entero | Resultado sintético de inversiones reconocido en el período, en millones de CLP. |
| `resultado_tecnico_millones_clp` | Número entero | Resultado técnico simplificado: prima retenida menos costo de siniestros y gastos administrativos, en millones de CLP. |
| `resultado_neto_millones_clp` | Número entero | Resultado neto sintético del período, en millones de CLP. |
| `reservas_tecnicas_millones_clp` | Número entero | Reservas técnicas sintéticas de la compañía al cierre del período, en millones de CLP. |
| `activos_millones_clp` | Número entero | Total de activos sintéticos al cierre del período, en millones de CLP. |
| `pasivos_millones_clp` | Número entero | Total de pasivos sintéticos al cierre del período, en millones de CLP. |
| `patrimonio_millones_clp` | Número entero | Patrimonio sintético al cierre del período, en millones de CLP. |
| `capital_disponible_millones_clp` | Número entero | Capital disponible sintético utilizado para el indicador simplificado de solvencia, en millones de CLP. |
| `capital_requerido_millones_clp` | Número entero | Capital requerido sintético utilizado para el indicador simplificado de solvencia, en millones de CLP. |
| `polizas_vigentes` | Número entero | Número sintético de pólizas vigentes al cierre del período. |
| `asegurados_vigentes` | Número entero | Número sintético de asegurados vigentes al cierre del período. |
| `nuevos_asegurados` | Número entero | Número sintético de nuevos asegurados incorporados durante el período. |
| `cancelaciones` | Número entero | Número sintético de cancelaciones registradas durante el período. |
| `siniestros_reportados` | Número entero | Número sintético de siniestros reportados durante el período. |
| `costo_promedio_siniestro_millones_clp` | Número decimal | Costo promedio sintético por siniestro pagado, en millones de CLP. |
| `tasa_siniestralidad_pct` | Número decimal | Costo de siniestros dividido por prima retenida neta, expresado como porcentaje. |
| `ratio_gastos_pct` | Número decimal | Gastos administrativos divididos por prima retenida neta, expresado como porcentaje. |
| `ratio_solvencia_pct` | Número decimal | Capital disponible dividido por capital requerido, expresado como porcentaje. Indicador educativo simplificado. |
| `roe_anualizado_pct` | Número decimal | ROE sintético anualizado calculado a partir del resultado neto trimestral y el patrimonio. Requiere revisión de plausibilidad. |
| `participacion_mercado_pct` | Número decimal | Participación de la compañía en la prima directa total del mercado ficticio durante el mismo período, expresada como porcentaje. |
