# Guía de validación — Fase 4

## Objetivo

Validar que las definiciones empresariales de los KPIs producen resultados coherentes y reproducibles antes de crear medidas DAX.

## Bloques

### Bloque A — Definición

- Revisar `documentacion/diccionario_kpis.md`.
- Confirmar nombre, fórmula, unidad, agregación e interpretación de cada KPI.
- Mantener el ROE excluido del conjunto principal.

### Bloque B — Validación SQL

Ejecutar:

```text
sql/06_validacion_kpis.sql
```

Orden:

1. Resumen del último período.
2. KPIs por compañía.
3. Ratios almacenados vs. recalculados.
4. Participación de mercado.
5. Mix de productos.
6. Control DQ-01.

### Bloque C — Revisión de resultados

Comprobar especialmente:

- Prima directa 2025-T4: 2.435.934 MM CLP.
- QoQ: 4,77%.
- YoY: 4,29%.
- Siniestralidad ponderada: 55,70%.
- Ratio de gastos: 12,79%.
- Margen técnico: 31,51%.
- Solvencia sintética: 180,48%.
- Asegurados vigentes: 9.134.304.
- Diferencias de ratios inferiores a 0,01 puntos porcentuales.
- Participación recalculada igual a 100,00% por período.

### Bloque D — Preparación para Power BI

No escribir todavía las medidas DAX definitivas.

Primero debe construirse y validarse:

- dimensión calendario;
- dimensión compañía;
- tabla de hechos;
- dimensión producto o tabla vertical de primas;
- relaciones y direcciones de filtro.

## Estado de la fase

La Fase 4 se considera completada cuando:

- el diccionario de KPIs está aprobado;
- `06_validacion_kpis.sql` produce los valores esperados;
- las reglas de aditividad están documentadas;
- el ROE permanece excluido del conjunto principal;
- los archivos se publican en GitHub;
- el README se actualiza a Fase 4 completada.
