-- ============================================================
-- PROYECTO: Analisis del Mercado Chileno de Seguros de Vida
-- FASE 3: Preparacion y analisis en SQL
-- ARCHIVO: Fase_02_validacion_calidad.sql
-- ============================================================

USE seguros_vida_chile;

-- 1. Volumen importado.
SELECT COUNT(*) AS filas,
       COUNT(DISTINCT compania_id) AS companias,
       COUNT(DISTINCT periodo) AS periodos,
       MIN(fecha_cierre) AS primera_fecha,
       MAX(fecha_cierre) AS ultima_fecha
	FROM mercado_asegurador_vida;

-- Resultado:
-- filas = 144
-- companias = 12
-- periodos = 12
-- primera_fecha = 2023-03-31
-- ultima_fecha = 2025-12-31

-- 2. Comprobacion de la granularidad compania + periodo.
SELECT compania_id,
       periodo,
       COUNT(*) AS cantidad
	FROM mercado_asegurador_vida
		GROUP BY compania_id, periodo
			HAVING COUNT(*) > 1;

-- Resultado: 0 filas.

-- 3. Comprobar valores NULL en las 39 columnas.
SELECT
    SUM(periodo IS NULL) AS nulos_periodo,
    SUM(fecha_cierre IS NULL) AS nulos_fecha_cierre,
    SUM(anio IS NULL) AS nulos_anio,
    SUM(trimestre IS NULL) AS nulos_trimestre,
    SUM(compania_id IS NULL) AS nulos_compania_id,
    SUM(compania IS NULL) AS nulos_compania,
    SUM(origen_capital IS NULL) AS nulos_origen_capital,
    SUM(segmento IS NULL) AS nulos_segmento,
    SUM(perfil_negocio IS NULL) AS nulos_perfil_negocio,
    SUM(prima_directa_millones_clp IS NULL) AS nulos_prima_directa_millones_clp,
    SUM(prima_retenida_neta_millones_clp IS NULL) AS nulos_prima_retenida_neta_millones_clp,
    SUM(prima_vida_proteccion_millones_clp IS NULL) AS nulos_prima_vida_proteccion_millones_clp,
    SUM(prima_salud_millones_clp IS NULL) AS nulos_prima_salud_millones_clp,
    SUM(prima_ahorro_apv_millones_clp IS NULL) AS nulos_prima_ahorro_apv_millones_clp,
    SUM(prima_rentas_vitalicias_millones_clp IS NULL) AS nulos_prima_rentas_vitalicias_millones_clp,
    SUM(prima_accidentes_personales_millones_clp IS NULL) AS nulos_prima_accidentes_personales_millones_clp,
    SUM(siniestros_pagados_millones_clp IS NULL) AS nulos_siniestros_pagados_millones_clp,
    SUM(costo_siniestros_millones_clp IS NULL) AS nulos_costo_siniestros_millones_clp,
    SUM(gastos_administracion_millones_clp IS NULL) AS nulos_gastos_administracion_millones_clp,
    SUM(resultado_inversiones_millones_clp IS NULL) AS nulos_resultado_inversiones_millones_clp,
    SUM(resultado_tecnico_millones_clp IS NULL) AS nulos_resultado_tecnico_millones_clp,
    SUM(resultado_neto_millones_clp IS NULL) AS nulos_resultado_neto_millones_clp,
    SUM(reservas_tecnicas_millones_clp IS NULL) AS nulos_reservas_tecnicas_millones_clp,
    SUM(activos_millones_clp IS NULL) AS nulos_activos_millones_clp,
    SUM(pasivos_millones_clp IS NULL) AS nulos_pasivos_millones_clp,
    SUM(patrimonio_millones_clp IS NULL) AS nulos_patrimonio_millones_clp,
    SUM(capital_disponible_millones_clp IS NULL) AS nulos_capital_disponible_millones_clp,
    SUM(capital_requerido_millones_clp IS NULL) AS nulos_capital_requerido_millones_clp,
    SUM(polizas_vigentes IS NULL) AS nulos_polizas_vigentes,
    SUM(asegurados_vigentes IS NULL) AS nulos_asegurados_vigentes,
    SUM(nuevos_asegurados IS NULL) AS nulos_nuevos_asegurados,
    SUM(cancelaciones IS NULL) AS nulos_cancelaciones,
    SUM(siniestros_reportados IS NULL) AS nulos_siniestros_reportados,
    SUM(costo_promedio_siniestro_millones_clp IS NULL) AS nulos_costo_promedio_siniestro_millones_clp,
    SUM(tasa_siniestralidad_pct IS NULL) AS nulos_tasa_siniestralidad_pct,
    SUM(ratio_gastos_pct IS NULL) AS nulos_ratio_gastos_pct,
    SUM(ratio_solvencia_pct IS NULL) AS nulos_ratio_solvencia_pct,
    SUM(roe_anualizado_pct IS NULL) AS nulos_roe_anualizado_pct,
    SUM(participacion_mercado_pct IS NULL) AS nulos_participacion_mercado_pct
		FROM mercado_asegurador_vida;

-- Resultado: todos los campos = 0.

-- 4. Coherencia temporal.
SELECT COUNT(*) AS inconsistencias_temporales
	FROM mercado_asegurador_vida
		WHERE anio <> YEAR(fecha_cierre)
			OR trimestre <> QUARTER(fecha_cierre)
			OR periodo <> CONCAT(anio, '-T', trimestre);

-- Resultado: 0.

-- 5. Comprobacion que cada compania tenga los 12 periodos.
SELECT compania_id,
       compania,
       COUNT(*) AS periodos_registrados
	FROM mercado_asegurador_vida
		GROUP BY compania_id, compania
			HAVING COUNT(*) <> 12;

-- Resultado: 0 filas.

-- 6. Diferencia entre prima directa y suma de primas por producto.
SELECT
    MAX(
        ABS(
            prima_directa_millones_clp -
			(prima_vida_proteccion_millones_clp
                + prima_salud_millones_clp
                + prima_ahorro_apv_millones_clp
                + prima_rentas_vitalicias_millones_clp
                + prima_accidentes_personales_millones_clp)
           )
	   ) AS diferencia_max_primas_millones_clp
	FROM mercado_asegurador_vida;

-- Resultado: 2.

-- 7. Coherencia del balance simplificado.
SELECT
    MAX(
        ABS(
            activos_millones_clp -
			(pasivos_millones_clp + patrimonio_millones_clp)
           )
	   ) AS diferencia_max_balance_millones_clp
	FROM mercado_asegurador_vida;

-- Resultado: 1.

-- 8. Participacion de mercado por periodo.
SELECT periodo,
	   ROUND(SUM(participacion_mercado_pct), 2) 
		AS participacion_total_pct
	FROM mercado_asegurador_vida
		GROUP BY periodo
			ORDER BY MIN(fecha_cierre);

-- Resultado: aproximadamente 100% por periodo
-- debido al redondeo: entre 99.99% y 100.02%.

-- 9. Recalculo de KPIs precalculados.
SELECT
    ROUND(
        MAX(
            ABS(tasa_siniestralidad_pct - 
                (costo_siniestros_millones_clp / 
					NULLIF(prima_retenida_neta_millones_clp, 0) * 100)
               )
			), 4
		 ) AS max_diferencia_siniestralidad_pp,

    ROUND(
        MAX(
            ABS(ratio_gastos_pct -
                 (gastos_administracion_millones_clp /
                   NULLIF(prima_retenida_neta_millones_clp, 0) * 100)
               )
           ), 4
		 ) AS max_diferencia_gastos_pp,

    ROUND(
        MAX(
            ABS(
                ratio_solvencia_pct -
                 (capital_disponible_millones_clp /
                    NULLIF(capital_requerido_millones_clp, 0) * 100)
               )
           ), 4
		 ) AS max_diferencia_solvencia_pp
FROM mercado_asegurador_vida;

-- Resultado: diferencias inferiores a 0.01 puntos porcentuales.

-- 10. Hallazgo DQ-01: rango del ROE sintetico.
SELECT
    MIN(roe_anualizado_pct) 
		AS roe_min_pct,
    ROUND(AVG(roe_anualizado_pct), 2) 
		AS roe_promedio_pct,
    MAX(roe_anualizado_pct) 
		AS roe_max_pct
	FROM mercado_asegurador_vida;

-- Nota:
-- El ROE se mantiene para fines de practica, pero no se usara como benchmark 
-- contra companias reales debido a la limitacion de plausibilidad documentada.
