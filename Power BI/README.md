# 📊 Power BI

## Archivo principal

```text
analisis_mercado_seguros_vida_chile.pbix
```

El archivo contiene el modelo semántico construido durante la Fase 5.

## Contenido actual

- Conexión Import a MySQL.
- Consulta de staging sin carga.
- Dimensión de fecha.
- Dimensión de compañías.
- Dimensión de productos.
- Tabla de hechos trimestral.
- Tabla de primas por producto.
- Cinco relaciones activas 1 ---> * y unidireccionales.
- Página temporal de validación del modelo.

## Fuente

```text
Base de datos: seguros_vida_chile
Tabla: mercado_asegurador_vida
```

La fuente se encuentra en una instancia local de MySQL y no está disponible públicamente.

Como el modelo utiliza modo Importar, el PBIX conserva los datos cargados y puede abrirse para revisar la estructura y los resultados guardados. Para actualizar la información se requiere configurar una fuente MySQL compatible y sus credenciales.

## Seguridad

El repositorio no incluye:

- contraseñas;
- credenciales;
- archivos internos del servidor MySQL;
- conexiones privadas exportadas;
- datos reales de asegurados.
