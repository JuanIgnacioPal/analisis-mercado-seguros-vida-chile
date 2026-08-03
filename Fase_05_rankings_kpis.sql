-- ============================================================
-- PROYECTO: Analisis del Mercado Chileno de Seguros de Vida
-- FASE 3: Preparacion y analisis en SQL
-- ARCHIVO: Fase_05_rankings_kpis.sql
-- ============================================================

USE seguros_vida_chile;

-- Nota DQ-01:
-- El ROE sintetico se excluye de los rankings principales de esta fase
-- porque su plausibilidad esta documentada como una limitacion del dataset.


-- R1. Ranking de participacion de mercado en el ultimo trimestre.
WITH ultimo_periodo AS (
    SELECT *
		FROM mercado_asegurador_vida
			WHERE fecha_cierre = (
				SELECT MAX(fecha_cierre)
					FROM mercado_asegurador_vida)
                    )
SELECT
    RANK() OVER(
        ORDER BY participacion_mercado_pct DESC) 
			AS ranking_market_share,
		periodo,
		compania_id,
		compania,
		prima_directa_millones_clp,
		participacion_mercado_pct
	FROM ultimo_periodo
		ORDER BY ranking_market_share, compania;


-- R2. Ranking de crecimiento interanual en el ultimo trimestre.
WITH crecimiento AS (
    SELECT periodo,
           fecha_cierre,
           compania_id,
           compania,
           prima_directa_millones_clp,
        LAG(prima_directa_millones_clp, 4)
            OVER (
                PARTITION BY compania_id
					ORDER BY fecha_cierre) 
						AS prima_anio_anterior
		FROM mercado_asegurador_vida),
ultimo AS (
    SELECT *,
        ROUND((prima_directa_millones_clp - prima_anio_anterior) /
			NULLIF(prima_anio_anterior, 0) * 100, 2) 
				AS crecimiento_yoy_pct
		FROM crecimiento
			WHERE fecha_cierre = (
	SELECT MAX(fecha_cierre)
        FROM mercado_asegurador_vida)
		  )
SELECT
    RANK() OVER(
        ORDER BY crecimiento_yoy_pct DESC) 
			AS ranking_crecimiento_yoy,
      periodo,
      compania_id,
      compania,
      prima_directa_millones_clp,
      crecimiento_yoy_pct
	FROM ultimo
		ORDER BY ranking_crecimiento_yoy, compania;


-- R3. Ranking de margen tecnico acumulado 2023-2025.
WITH desempeno AS (
    SELECT
          compania_id,
          compania,
          SUM(prima_retenida_neta_millones_clp) AS prima_retenida_millones_clp,
          SUM(resultado_tecnico_millones_clp) AS resultado_tecnico_millones_clp,
          ROUND(SUM(resultado_tecnico_millones_clp) /
			NULLIF(SUM(prima_retenida_neta_millones_clp), 0) * 100,2) 
				AS margen_tecnico_pct
		FROM mercado_asegurador_vida
			GROUP BY compania_id, compania)
SELECT
    RANK() OVER (
        ORDER BY margen_tecnico_pct DESC) 
			AS ranking_margen_tecnico,
     compania_id,
     compania,
     prima_retenida_millones_clp,
     resultado_tecnico_millones_clp,
     margen_tecnico_pct
	FROM desempeno
		ORDER BY ranking_margen_tecnico, compania;


-- R4. Ranking de solvencia sintetica en el ultimo trimestre.
WITH ultimo_periodo AS (
    SELECT *
		FROM mercado_asegurador_vida
			WHERE fecha_cierre = (
	SELECT MAX(fecha_cierre)
        FROM mercado_asegurador_vida)
)
SELECT
    RANK() OVER (
        ORDER BY ratio_solvencia_pct DESC) 
			AS ranking_solvencia,
      periodo,
      compania_id,
      compania,
      capital_disponible_millones_clp,
      capital_requerido_millones_clp,
      ratio_solvencia_pct
	FROM ultimo_periodo
		ORDER BY ranking_solvencia, compania;


-- R5. Comparacion de siniestralidad y gastos acumulados.
WITH eficiencia AS (
    SELECT compania_id,
           compania,
        ROUND(SUM(costo_siniestros_millones_clp) /
			NULLIF(SUM(prima_retenida_neta_millones_clp), 0) * 100, 2) 
				AS siniestralidad_ponderada_pct,
        ROUND(SUM(gastos_administracion_millones_clp) /
			NULLIF(SUM(prima_retenida_neta_millones_clp), 0) * 100, 2) 
				AS ratio_gastos_ponderado_pct,
        SUM(resultado_tecnico_millones_clp) 
				AS resultado_tecnico_millones_clp
		FROM mercado_asegurador_vida
			GROUP BY compania_id, compania)
SELECT compania_id,
       compania,
       siniestralidad_ponderada_pct,
       ratio_gastos_ponderado_pct,
       resultado_tecnico_millones_clp
	FROM eficiencia
		ORDER BY
	siniestralidad_ponderada_pct ASC,
    ratio_gastos_ponderado_pct ASC;
