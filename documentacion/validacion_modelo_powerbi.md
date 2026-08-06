# ✅ Validación del modelo Power BI — Fase 5

## Resultado general

**Modelo aprobado.**

El modelo fue validado mediante conteos, revisión de relaciones y pruebas funcionales con segmentadores.

## Conteos confirmados

| Tabla | Filas | Columnas |
|---|---:|---:|
| `D_Compania` | 12 | 5 |
| `D_Producto` | 5 | 3 |
| `D_Fecha` | 1.096 | 6 |
| `H_Mercado_Trimestral` | 144 | 21 |
| `H_Primas_Producto` | 720 | 4 |

## Relaciones confirmadas

- Cinco relaciones activas.
- Cardinalidad uno a muchos.
- Dirección de filtro única desde dimensiones hacia hechos.
- Sin relaciones muchos a muchos.
- Sin relaciones bidireccionales.
- Sin relación directa entre las tablas de hechos.

## Pruebas funcionales

### Filtro temporal

Al seleccionar `2025-T4`:

| Control | Resultado |
|---|---:|
| Prima directa | 2.435.934 MM CLP |
| Prima por producto | 2.435.937 MM CLP |

La diferencia de 3 MM CLP corresponde al redondeo de los componentes sintéticos y no se corrige artificialmente.

### Filtro de compañía

El segmentador de compañía modifica correctamente:

- la prima directa;
- la prima por producto.

Esto confirma que `D_Compania` filtra ambas tablas de hechos.

### Filtro de producto

El segmentador de producto modifica únicamente la prima por producto.

La prima directa total permanece sin cambios, porque las métricas generales no están desglosadas por producto.

### Integridad de claves

- 12 compañías sin categoría en blanco.
- 5 productos sin categoría en blanco.
- Períodos desde 2023-T1 hasta 2025-T4.
- No se detectaron claves sin correspondencia en las dimensiones.

## Presentación de valores

Las tarjetas de validación fueron configuradas con:

- unidades de visualización: Ninguno;
- cero decimales;
- separador de miles;
- etiqueta de unidad `MM CLP`, en lugar de formato monetario abreviado.

Esto evita que Power BI convierta valores como `2.435.934` en una abreviatura visual ambigua.

## Limitaciones

- Los datos y compañías son completamente sintéticos.
- El modelo utiliza modo Importar y representa una copia del dataset en el momento de la última actualización.
- Para actualizar desde otra computadora se requiere acceso a la fuente MySQL y configurar nuevamente las credenciales.
- El ratio de solvencia es sintético.
- El ROE permanece excluido de los KPIs principales por DQ-01.

## Estado

**Fase 5 — Modelado de datos en Power BI: COMPLETADA TÉCNICAMENTE**
