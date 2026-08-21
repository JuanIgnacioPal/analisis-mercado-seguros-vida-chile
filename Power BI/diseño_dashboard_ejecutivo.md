# 🎨 Diseño del dashboard ejecutivo — Fase 6

## Objetivo

Transformar la capa analítica validada en una experiencia ejecutiva compacta, comprensible y consistente con un contexto de seguros de vida.

## Arquitectura

El dashboard contiene cuatro páginas:

| Página | Propósito |
|---|---|
| `Resumen Ejecutivo` | Visión consolidada del mercado y sus principales KPIs. |
| `Mercado y Competencia` | Liderazgo, participación, crecimiento y posicionamiento competitivo. |
| `Desempeño Técnico` | Siniestralidad, gastos, resultado, margen y solvencia sintética. |
| `Productos y Cartera` | Mix de productos, asegurados, pólizas, altas y cancelaciones. |

La página técnica `Validacion_Modelo` se conserva para QA, pero no forma parte del recorrido ejecutivo.

## Identidad visual

- Formato: 16:9.
- Paleta corporativa basada en azules.
- Jerarquía visual consistente entre páginas.
- Uso limitado de rojo/verde para estados cuando existe además una señal textual o numérica.

## Filtros

### Período

`D_Fecha[año_trimestre]` se usa con selección única y `2025-T4` como estado inicial.

### Compañía

Se utiliza en las páginas donde el objetivo incluye analizar una aseguradora concreta.

### Producto

No se utiliza como slicer global. El producto se explora mediante visuales de composición y solo filtra la tabla de hechos de primas por producto.

## Interacciones relevantes

Los gráficos históricos conservan los 12 trimestres aunque el slicer de período esté en `2025-T4`. De este modo, las tarjetas muestran el período actual mientras los gráficos mantienen el contexto temporal completo.

Los rankings de mercado permanecen como benchmarks cuando se selecciona una compañía en páginas donde interesa comparar una entidad contra el mercado.

## Accesibilidad y lectura

- Títulos descriptivos.
- Etiquetas y unidades explícitas.
- Contraste alto entre texto y fondo.
- El color no es el único mecanismo para señalar crecimiento positivo o negativo.
- Tooltips se usan como información complementaria, no como único lugar donde reside un dato esencial.
