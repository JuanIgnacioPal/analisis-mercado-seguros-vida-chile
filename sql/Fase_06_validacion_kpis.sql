-- ============================================================
-- PROYECTO: Analisis del Mercado Chileno de Seguros de Vida
-- FASE 4: Construccion y validacion de KPIs
-- ARCHIVO: Fase_06_validacion_kpis.sql
-- MOTOR: MySQL 8.0
-- ============================================================

USE seguros_vida_chile;

-- ============================================================
-- 1. RESUMEN DE KPIs DEL ULTIMO PERIODO
-- ============================================================

WITH mercado_trimestral AS (
    SELECT periodo,
		   fecha_cierre,
           SUM(prima_directa_millones_clp) AS prima_directa,
		   SUM(prima_retenida_neta_millones_clp) AS prima_retenida,
           SUM(costo_siniestros_millones_clp) AS costo_siniestros,
		   SUM(gastos_administracion_millones_clp) AS gastos_administracion,
           SUM(resultado_tecnico_millones_clp) AS resultado_tecnico,
           SUM(resultado_neto_millones_clp) AS resultado_neto,
           SUM(capital_disponible_millones_clp) AS capital_disponible,
           SUM(capital_requerido_millones_clp) AS capital_requerido,
		   SUM(polizas_vigentes) AS polizas_vigentes,
           SUM(asegurados_vigentes) AS asegurados_vigentes,
           SUM(nuevos_asegurados) AS nuevos_asegurados,
           SUM(cancelaciones) AS cancelaciones
		FROM mercado_asegurador_vida
			GROUP BY periodo, fecha_cierre
),
comparaciones AS (
    SELECT *,
		   LAG(prima_directa, 1)
			 OVER (ORDER BY fecha_cierre) AS prima_trimestre_anterior,
           LAG(prima_directa, 4)
             OVER (ORDER BY fecha_cierre) AS prima_anio_anterior,
           LAG(asegurados_vigentes, 4)
             OVER (ORDER BY fecha_cierre) AS asegurados_anio_anterior
		FROM mercado_trimestral
)
SELECT periodo,
       fecha_cierre,
	   prima_directa AS kpi_01_prima_directa_millones_clp,
       
	   ROUND(
			 (prima_directa - prima_trimestre_anterior) /
				NULLIF(prima_trimestre_anterior, 0) * 100, 2) 
					AS kpi_03_crecimiento_qoq_pct,
	   ROUND(
			 (prima_directa - prima_anio_anterior) /
			    NULLIF(prima_anio_anterior, 0) * 100, 2) 
					AS kpi_04_crecimiento_yoy_pct,
                    
	   prima_retenida AS medida_prima_retenida_millones_clp,
	   ROUND(costo_siniestros /
		NULLIF(prima_retenida, 0) * 100, 2) 
					AS kpi_05_siniestralidad_pct,

	   ROUND(gastos_administracion /
		NULLIF(prima_retenida, 0) * 100, 2) 
					AS kpi_06_ratio_gastos_pct,

	   resultado_tecnico 
					AS kpi_07_resultado_tecnico_millones_clp,

	   ROUND(resultado_tecnico /
		NULLIF(prima_retenida, 0) * 100, 2) 
					AS kpi_08_margen_tecnico_pct,

    resultado_neto  AS kpi_09_resultado_neto_millones_clp,

	   ROUND(capital_disponible /
		NULLIF(capital_requerido, 0) * 100, 2) 
					AS kpi_10_solvencia_sintetica_pct,

    polizas_vigentes AS medida_polizas_vigentes,
    asegurados_vigentes 
					AS kpi_11_asegurados_vigentes,

    ROUND(
		  (asegurados_vigentes - asegurados_anio_anterior) /
			NULLIF(asegurados_anio_anterior, 0) * 100, 2) 
					AS kpi_12_crecimiento_asegurados_yoy_pct,

    nuevos_asegurados AS medida_nuevos_asegurados,
    cancelaciones AS medida_cancelaciones,
    nuevos_asegurados - cancelaciones AS medida_saldo_neto_cartera

FROM comparaciones
WHERE fecha_cierre = (
    SELECT MAX(fecha_cierre)
    FROM mercado_asegurador_vida
);

-- Resultados para 2025-T4:
-- Prima directa:             2435934
-- QoQ:                       4.77
-- YoY:                       4.29
-- Prima retenida:            2336531
-- Siniestralidad:            55.70
-- Ratio de gastos:           12.79
-- Resultado tecnico:         736330
-- Margen tecnico:            31.51
-- Resultado neto:            768696
-- Solvencia sintetica:       180.48
-- Polizas vigentes:          7828045
-- Asegurados vigentes:       9134304
-- Nuevos asegurados:         292967
-- Cancelaciones:             157660
-- Saldo neto de cartera:     135307


-- ============================================================
-- 2. KPIs POR COMPANIA EN EL ULTIMO PERIODO
-- ============================================================

SELECT periodo,
       compania_id,
       compania,
       prima_directa_millones_clp,

    ROUND(prima_directa_millones_clp /
        NULLIF(
            SUM(prima_directa_millones_clp) OVER (PARTITION BY periodo),
            0) * 100,2) 
				AS kpi_02_participacion_mercado_pct,

    ROUND(costo_siniestros_millones_clp /
	  NULLIF(prima_retenida_neta_millones_clp, 0) * 100, 2) 
				AS kpi_05_siniestralidad_pct,

    ROUND(gastos_administracion_millones_clp /
	  NULLIF(prima_retenida_neta_millones_clp, 0) * 100, 2) 
				AS kpi_06_ratio_gastos_pct,

    resultado_tecnico_millones_clp 
				AS kpi_07_resultado_tecnico_millones_clp,

    ROUND(resultado_tecnico_millones_clp /
	  NULLIF(prima_retenida_neta_millones_clp, 0) * 100, 2) 
				AS kpi_08_margen_tecnico_pct,

    resultado_neto_millones_clp 
				AS kpi_09_resultado_neto_millones_clp,

    ROUND(capital_disponible_millones_clp /
	  NULLIF(capital_requerido_millones_clp, 0) * 100, 2)
				AS kpi_10_solvencia_sintetica_pct,

    asegurados_vigentes 
				AS kpi_11_asegurados_vigentes

	FROM mercado_asegurador_vida
		WHERE fecha_cierre = (
			SELECT MAX(fecha_cierre)
	FROM mercado_asegurador_vida)
		ORDER BY kpi_02_participacion_mercado_pct DESC;


-- ============================================================
-- 3. VALIDACION DE RATIOS ALMACENADOS VS. RECALCULADOS
-- ============================================================

SELECT ROUND(
		  MAX(
		   ABS(tasa_siniestralidad_pct - 
			  (costo_siniestros_millones_clp /
			  NULLIF(prima_retenida_neta_millones_clp, 0) * 100)
              )
             ), 4
) AS max_diferencia_siniestralidad_pp,

    ROUND(
	   MAX(
	    ABS(ratio_gastos_pct- 
		   (gastos_administracion_millones_clp / 
           NULLIF(prima_retenida_neta_millones_clp, 0) * 100)
		   )
          ), 4
) AS max_diferencia_ratio_gastos_pp,

    ROUND(
	   MAX(
	    ABS(ratio_solvencia_pct - 
		   (capital_disponible_millones_clp / 
           NULLIF(capital_requerido_millones_clp, 0) * 100)
		   )
          ), 4
) AS max_diferencia_solvencia_pp

FROM mercado_asegurador_vida;

-- Resultado:
-- Las tres diferencias deben ser inferiores a 0.01 puntos porcentuales.


-- ============================================================
-- 4. CONTROL DE PARTICIPACION DE MERCADO
-- ============================================================

WITH participaciones AS (
    SELECT periodo,
           fecha_cierre,
           prima_directa_millones_clp / 
           NULLIF(SUM(prima_directa_millones_clp)
                OVER (PARTITION BY periodo), 0) * 100 
			AS participacion_recalculada_pct
    FROM mercado_asegurador_vida)
    
SELECT periodo,
       ROUND(SUM(participacion_recalculada_pct), 2) 
		AS participacion_total_recalculada_pct
	FROM participaciones
	 GROUP BY periodo
	  ORDER BY MIN(fecha_cierre);

-- Resultado: 100.00% por periodo al recalcular sin redondear cada fila.


-- ============================================================
-- 5. MIX DE PRODUCTOS DEL ULTIMO PERIODO
-- ============================================================

WITH productos AS (
    SELECT 'Vida y Proteccion' AS producto,
	SUM(prima_vida_proteccion_millones_clp) AS prima_producto
		FROM mercado_asegurador_vida
		  WHERE fecha_cierre = (SELECT MAX(fecha_cierre) 
		FROM mercado_asegurador_vida)

    UNION ALL

    SELECT 'Salud',
		   SUM(prima_salud_millones_clp)
		FROM mercado_asegurador_vida
	      WHERE fecha_cierre = (SELECT MAX(fecha_cierre) 
		FROM mercado_asegurador_vida)

    UNION ALL

    SELECT 'Ahorro / APV',
		   SUM(prima_ahorro_apv_millones_clp)
		FROM mercado_asegurador_vida
		  WHERE fecha_cierre = (SELECT MAX(fecha_cierre) 
		FROM mercado_asegurador_vida)

    UNION ALL

    SELECT 'Rentas Vitalicias',
		   SUM(prima_rentas_vitalicias_millones_clp)
		FROM mercado_asegurador_vida
		  WHERE fecha_cierre = (SELECT MAX(fecha_cierre) 
		FROM mercado_asegurador_vida)

    UNION ALL

    SELECT 'Accidentes Personales',
		   SUM(prima_accidentes_personales_millones_clp)
		FROM mercado_asegurador_vida
		  WHERE fecha_cierre = (SELECT MAX(fecha_cierre) 
		FROM mercado_asegurador_vida)
),
total AS (
    SELECT SUM(prima_directa_millones_clp) AS prima_directa_total
		FROM mercado_asegurador_vida
		  WHERE fecha_cierre = (SELECT MAX(fecha_cierre) 
		FROM mercado_asegurador_vida)
)
SELECT producto,
       prima_producto AS prima_producto_millones_clp,
       ROUND( prima_producto / 
       NULLIF(prima_directa_total, 0) * 100, 2) AS participacion_mix_pct
	FROM productos
	  CROSS JOIN total
		ORDER BY prima_producto DESC;

-- Valores aproximados esperados para 2025-T4:
-- Rentas Vitalicias:       29.60%
-- Vida y Proteccion:       28.78%
-- Ahorro / APV:            20.26%
-- Salud:                    12.99%
-- Accidentes Personales:    8.37%


-- ============================================================
-- 6. CONTROL DQ-01: ROE FUERA DEL CONJUNTO PRINCIPAL
-- ============================================================

SELECT MIN(roe_anualizado_pct) AS roe_min_pct,
       ROUND(AVG(roe_anualizado_pct), 2) AS roe_promedio_pct,
       MAX(roe_anualizado_pct) AS roe_max_pct,
       COUNT(*) AS observaciones
	FROM mercado_asegurador_vida;

-- El resultado se documenta, pero no se incorpora al conjunto principal de KPIs.
