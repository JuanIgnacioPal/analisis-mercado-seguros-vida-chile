-- ============================================================
-- PROYECTO: Analisis del Mercado Chileno de Seguros de Vida
-- FASE 3: Preparacion y analisis en SQL
-- ARCHIVO: Fase_01_creacion_base_tabla.sql
-- MOTOR: MySQL 9.7.1
-- ============================================================

-- 1. Creacion de la base de datos.
CREATE DATABASE IF NOT EXISTS seguros_vida_chile
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE seguros_vida_chile;

-- 2. Creacion de la tabla principal.
-- Granularidad: una fila por compania ficticia y trimestre.
CREATE TABLE IF NOT EXISTS mercado_asegurador_vida (
    periodo VARCHAR(7) NOT NULL,
    fecha_cierre DATE NOT NULL,
    anio SMALLINT UNSIGNED NOT NULL,
    trimestre TINYINT UNSIGNED NOT NULL,

    compania_id CHAR(4) NOT NULL,
    compania VARCHAR(100) NOT NULL,
    origen_capital VARCHAR(20) NOT NULL,
    segmento VARCHAR(50) NOT NULL,
    perfil_negocio VARCHAR(120) NOT NULL,

    prima_directa_millones_clp BIGINT NOT NULL,
    prima_retenida_neta_millones_clp BIGINT NOT NULL,
    prima_vida_proteccion_millones_clp BIGINT NOT NULL,
    prima_salud_millones_clp BIGINT NOT NULL,
    prima_ahorro_apv_millones_clp BIGINT NOT NULL,
    prima_rentas_vitalicias_millones_clp BIGINT NOT NULL,
    prima_accidentes_personales_millones_clp BIGINT NOT NULL,

    siniestros_pagados_millones_clp BIGINT NOT NULL,
    costo_siniestros_millones_clp BIGINT NOT NULL,
    gastos_administracion_millones_clp BIGINT NOT NULL,
    resultado_inversiones_millones_clp BIGINT NOT NULL,
    resultado_tecnico_millones_clp BIGINT NOT NULL,
    resultado_neto_millones_clp BIGINT NOT NULL,

    reservas_tecnicas_millones_clp BIGINT NOT NULL,
    activos_millones_clp BIGINT NOT NULL,
    pasivos_millones_clp BIGINT NOT NULL,
    patrimonio_millones_clp BIGINT NOT NULL,
    capital_disponible_millones_clp BIGINT NOT NULL,
    capital_requerido_millones_clp BIGINT NOT NULL,

    polizas_vigentes INT UNSIGNED NOT NULL,
    asegurados_vigentes INT UNSIGNED NOT NULL,
    nuevos_asegurados INT UNSIGNED NOT NULL,
    cancelaciones INT UNSIGNED NOT NULL,
    siniestros_reportados INT UNSIGNED NOT NULL,

    costo_promedio_siniestro_millones_clp DECIMAL(12,2) NOT NULL,
    tasa_siniestralidad_pct DECIMAL(7,2) NOT NULL,
    ratio_gastos_pct DECIMAL(7,2) NOT NULL,
    ratio_solvencia_pct DECIMAL(7,2) NOT NULL,
    roe_anualizado_pct DECIMAL(7,2) NOT NULL,
    participacion_mercado_pct DECIMAL(7,2) NOT NULL,

    PRIMARY KEY (compania_id, periodo),
		INDEX idx_periodo (periodo),
		INDEX idx_fecha_cierre (fecha_cierre),
		INDEX idx_compania (compania)
			) ENGINE=InnoDB;

-- 3. Comprobacion que la tabla existe y revision de su estructura.
SHOW TABLES;
	DESCRIBE mercado_asegurador_vida;
		SHOW CREATE TABLE mercado_asegurador_vida;


