// Consulta Power Query utilizada en la Fase 2.
// Antes de actualizar la consulta en otro equipo, reemplazar <RUTA_LOCAL>
// por la ruta local donde se haya clonado/descargado el repositorio.

section Section1;

shared mercado_asegurador_vida_raw = let
    Source = Csv.Document(
        File.Contents("<RUTA_LOCAL>\\datos\\raw\\mercado_asegurador_vida_chile_sintetico.csv"),
        [
            Delimiter=",",
            Columns=39,
            Encoding=65001,
            QuoteStyle=QuoteStyle.None
        ]
    ),
    #"Promoted Headers" = Table.PromoteHeaders(
        Source,
        [PromoteAllScalars=true]
    ),
    #"Changed Type" = Table.TransformColumnTypes(
        #"Promoted Headers",
        {
            {"periodo", type text},
            {"fecha_cierre", type date},
            {"anio", Int64.Type},
            {"trimestre", Int64.Type},
            {"compania_id", type text},
            {"compania", type text},
            {"origen_capital", type text},
            {"segmento", type text},
            {"perfil_negocio", type text},
            {"prima_directa_millones_clp", Int64.Type},
            {"prima_retenida_neta_millones_clp", Int64.Type},
            {"prima_vida_proteccion_millones_clp", Int64.Type},
            {"prima_salud_millones_clp", Int64.Type},
            {"prima_ahorro_apv_millones_clp", Int64.Type},
            {"prima_rentas_vitalicias_millones_clp", Int64.Type},
            {"prima_accidentes_personales_millones_clp", Int64.Type},
            {"siniestros_pagados_millones_clp", Int64.Type},
            {"costo_siniestros_millones_clp", Int64.Type},
            {"gastos_administracion_millones_clp", Int64.Type},
            {"resultado_inversiones_millones_clp", Int64.Type},
            {"resultado_tecnico_millones_clp", Int64.Type},
            {"resultado_neto_millones_clp", Int64.Type},
            {"reservas_tecnicas_millones_clp", Int64.Type},
            {"activos_millones_clp", Int64.Type},
            {"pasivos_millones_clp", Int64.Type},
            {"patrimonio_millones_clp", Int64.Type},
            {"capital_disponible_millones_clp", Int64.Type},
            {"capital_requerido_millones_clp", Int64.Type},
            {"polizas_vigentes", Int64.Type},
            {"asegurados_vigentes", Int64.Type},
            {"nuevos_asegurados", Int64.Type},
            {"cancelaciones", Int64.Type},
            {"siniestros_reportados", Int64.Type},
            {"costo_promedio_siniestro_millones_clp", type number},
            {"tasa_siniestralidad_pct", type number},
            {"ratio_gastos_pct", type number},
            {"ratio_solvencia_pct", type number},
            {"roe_anualizado_pct", type number},
            {"participacion_mercado_pct", type number}
        }
    )
in
    #"Changed Type";
