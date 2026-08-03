-- ============================================================
-- PROYECTO: Analisis del Mercado Chileno de Seguros de Vida
-- FASE 3: Preparacion y analisis en SQL
-- ARCHIVO: Fase_03_analisis_mercado.sql
-- ============================================================

USE seguros_vida_chile;

-- Q1. Evolucion del tamano del mercado por trimestre.
SELECT periodo,
	   fecha_cierre,
    SUM(prima_directa_millones_clp) AS prima_directa_mercado_millones_clp,
    SUM(prima_retenida_neta_millones_clp) AS prima_retenida_mercado_millones_clp,
    SUM(resultado_tecnico_millones_clp) AS resultado_tecnico_mercado_millones_clp,
    SUM(resultado_neto_millones_clp) AS resultado_neto_mercado_millones_clp,
    SUM(polizas_vigentes) AS polizas_vigentes_mercado,
    SUM(asegurados_vigentes) AS asegurados_vigentes_mercado
FROM mercado_asegurador_vida
	GROUP BY periodo, fecha_cierre
		ORDER BY fecha_cierre;


-- Q2. Prima directa acumulada por compania durante 2023-2025.
SELECT compania_id,
       compania,
       origen_capital,
    SUM(prima_directa_millones_clp) AS prima_directa_acumulada_millones_clp,
    SUM(resultado_neto_millones_clp) AS resultado_neto_acumulado_millones_clp
FROM mercado_asegurador_vida
	GROUP BY compania_id, compania, origen_capital
		ORDER BY prima_directa_acumulada_millones_clp DESC;
                

-- Q3. Participacion de mercado en el ultimo periodo disponible.
SELECT periodo,
       compania_id,
       compania,
       origen_capital,
       prima_directa_millones_clp,
       participacion_mercado_pct
FROM mercado_asegurador_vida
	WHERE fecha_cierre = (
		SELECT MAX(fecha_cierre)
FROM mercado_asegurador_vida)
		ORDER BY participacion_mercado_pct DESC;


-- Q4. Desempeno tecnico y eficiencia acumulada por compania.
-- Las tasas se recalculan de forma ponderada a partir de montos.
SELECT compania_id,
       compania,
       origen_capital,
    SUM(prima_retenida_neta_millones_clp) AS prima_retenida_acumulada_millones_clp,
    SUM(costo_siniestros_millones_clp) AS costo_siniestros_acumulado_millones_clp,
    SUM(gastos_administracion_millones_clp) AS gastos_administracion_acumulados_millones_clp,
    SUM(resultado_tecnico_millones_clp) AS resultado_tecnico_acumulado_millones_clp,
    SUM(resultado_neto_millones_clp) AS resultado_neto_acumulado_millones_clp,
    ROUND(
        SUM(costo_siniestros_millones_clp) /
         NULLIF(SUM(prima_retenida_neta_millones_clp), 0) * 100, 2) 
			AS siniestralidad_ponderada_pct,

    ROUND(
        SUM(gastos_administracion_millones_clp) /
         NULLIF(SUM(prima_retenida_neta_millones_clp), 0) * 100, 2) 
			AS ratio_gastos_ponderado_pct,

    ROUND(
        SUM(resultado_tecnico_millones_clp) /
         NULLIF(SUM(prima_retenida_neta_millones_clp), 0) * 100, 2) 
			AS margen_tecnico_pct

FROM mercado_asegurador_vida
	GROUP BY compania_id, compania, origen_capital
		ORDER BY resultado_tecnico_acumulado_millones_clp DESC;


-- Q5. Mix de productos del mercado completo.
SELECT producto,
	   prima_millones_clp,
       ROUND(prima_millones_clp /
		NULLIF(
            (SELECT SUM(prima_directa_millones_clp)
FROM mercado_asegurador_vida), 0) * 100, 2) 
	AS participacion_mix_pct
FROM ( SELECT 'Vida y Proteccion' AS producto,
	   SUM(prima_vida_proteccion_millones_clp) 
			AS prima_millones_clp
FROM mercado_asegurador_vida

	UNION ALL
		SELECT 'Salud',
			    SUM(prima_salud_millones_clp)
FROM mercado_asegurador_vida

	UNION ALL
		SELECT 'Ahorro / APV',
			    SUM(prima_ahorro_apv_millones_clp)
FROM mercado_asegurador_vida

	UNION ALL
		SELECT 'Rentas Vitalicias',
				SUM(prima_rentas_vitalicias_millones_clp)
FROM mercado_asegurador_vida

	UNION ALL
		SELECT 'Accidentes Personales',
			    SUM(prima_accidentes_personales_millones_clp)
FROM mercado_asegurador_vida) AS mix
	ORDER BY prima_millones_clp DESC;


-- Q6. Comparacion entre companias ficticias locales y multinacionales.
SELECT origen_capital,
       COUNT(DISTINCT compania_id) AS companias,
	   SUM(prima_directa_millones_clp) AS prima_directa_acumulada_millones_clp,
       SUM(resultado_neto_millones_clp) AS resultado_neto_acumulado_millones_clp,
       ROUND(SUM(costo_siniestros_millones_clp) / 
       NULLIF(SUM(prima_retenida_neta_millones_clp), 0) * 100, 2) 
		AS siniestralidad_ponderada_pct,
       ROUND(
	   SUM(gastos_administracion_millones_clp) /
	   NULLIF(SUM(prima_retenida_neta_millones_clp), 0) * 100, 2) 
		AS ratio_gastos_ponderado_pct
FROM mercado_asegurador_vida
	GROUP BY origen_capital
		ORDER BY prima_directa_acumulada_millones_clp DESC;
