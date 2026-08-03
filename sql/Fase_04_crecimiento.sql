-- ============================================================
-- PROYECTO: Analisis del Mercado Chileno de Seguros de Vida
-- FASE 3: Preparacion y analisis en SQL
-- ARCHIVO: Fase_04_crecimiento.sql
-- ============================================================

USE seguros_vida_chile;

-- Q1. Crecimiento trimestral (QoQ) de prima directa por compania.
WITH crecimiento_trimestral AS (
    SELECT periodo,
		   fecha_cierre,
           compania_id,
           compania,
           prima_directa_millones_clp,
        LAG(prima_directa_millones_clp, 1)
            OVER(
                PARTITION BY compania_id
					ORDER BY fecha_cierre) 
						AS prima_trimestre_anterior
		FROM mercado_asegurador_vida)
SELECT periodo,
       fecha_cierre,
       compania_id,
       compania,
       prima_directa_millones_clp,
       prima_trimestre_anterior,
    ROUND(
        (prima_directa_millones_clp - prima_trimestre_anterior)
        / NULLIF(prima_trimestre_anterior, 0) * 100, 2) 
			AS crecimiento_qoq_pct
	FROM crecimiento_trimestral
		ORDER BY compania_id, fecha_cierre;


-- Q2. Crecimiento interanual (YoY) de prima directa por compania.
WITH crecimiento_interanual AS (
    SELECT periodo,
           fecha_cierre,
           compania_id,
           compania,
           prima_directa_millones_clp,
        LAG(prima_directa_millones_clp, 4)
            OVER (
                PARTITION BY compania_id
					ORDER BY fecha_cierre) 
						AS prima_mismo_trimestre_anio_anterior
		FROM mercado_asegurador_vida)
SELECT periodo,
       fecha_cierre,
       compania_id,
       compania,
       prima_directa_millones_clp,
       prima_mismo_trimestre_anio_anterior,
    ROUND(
        (prima_directa_millones_clp - prima_mismo_trimestre_anio_anterior)
        / NULLIF(prima_mismo_trimestre_anio_anterior, 0) * 100, 2) 
			AS crecimiento_yoy_pct
	FROM crecimiento_interanual
		ORDER BY compania_id, fecha_cierre;


-- Q3. Crecimiento trimestral e interanual del mercado completo.
WITH mercado_trimestral AS (
    SELECT periodo,
           fecha_cierre,
        SUM(prima_directa_millones_clp) 
			AS prima_directa_mercado_millones_clp
		FROM mercado_asegurador_vida
			GROUP BY periodo, fecha_cierre),
comparacion AS (
    SELECT periodo,
           fecha_cierre,
           prima_directa_mercado_millones_clp,
        LAG(prima_directa_mercado_millones_clp, 1)
            OVER(ORDER BY fecha_cierre) 
				AS prima_trimestre_anterior,
        LAG(prima_directa_mercado_millones_clp, 4)
            OVER(ORDER BY fecha_cierre) 
				AS prima_anio_anterior
    FROM mercado_trimestral)
SELECT periodo,
       fecha_cierre,
       prima_directa_mercado_millones_clp,
    ROUND(
        (prima_directa_mercado_millones_clp - prima_trimestre_anterior) /
			NULLIF(prima_trimestre_anterior, 0) * 100, 2) 
				AS crecimiento_mercado_qoq_pct,
    ROUND(
        (prima_directa_mercado_millones_clp - prima_anio_anterior) /
			NULLIF(prima_anio_anterior, 0) * 100, 2) 
				AS crecimiento_mercado_yoy_pct
	FROM comparacion
		ORDER BY fecha_cierre;


-- Q4. Crecimiento interanual de asegurados vigentes por compañía.

WITH cartera AS (
    SELECT periodo,
           fecha_cierre,
           compania_id,
           compania,
           asegurados_vigentes,
		LAG(asegurados_vigentes, 4)
            OVER(
                PARTITION BY compania_id
					ORDER BY fecha_cierre) 
						AS asegurados_anio_anterior

		FROM mercado_asegurador_vida)

SELECT periodo,
       fecha_cierre,
       compania_id,
       compania,
       asegurados_vigentes,
       asegurados_anio_anterior,

    ROUND(
		(CAST(asegurados_vigentes AS SIGNED) -
             CAST(asegurados_anio_anterior AS SIGNED)) /
				NULLIF(CAST(asegurados_anio_anterior AS SIGNED), 0) * 100, 2) 
					AS crecimiento_asegurados_yoy_pct
	FROM cartera
		ORDER BY compania_id, fecha_cierre DESC;
