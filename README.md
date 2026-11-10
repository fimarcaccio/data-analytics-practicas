# RetailPro – Proyecto de Análisis de Datos

## Descripción del proyecto

Este repositorio contiene el desarrollo de un proyecto de análisis de datos aplicado al contexto comercial de RetailPro.

El objetivo es construir una base de datos relacional, realizar consultas SQL para obtener información relevante del negocio y preparar un modelo de datos en Power BI que permita analizar el comportamiento de las ventas y facilitar la toma de decisiones comerciales.

El proyecto se desarrolla de forma incremental, integrando tareas de modelado, extracción, transformación, análisis y visualización de datos.

## Objetivos

- Diseñar y crear una base de datos relacional para registrar la actividad comercial.
- Organizar la información de clientes, productos, categorías y ventas.
- Utilizar consultas SQL para analizar la facturación y el comportamiento de las ventas.
- Integrar distintas tablas mediante JOIN para enriquecer el análisis.
- Preparar un modelo de datos y medidas DAX en Power BI.
- Generar información útil para la toma de decisiones del equipo comercial.

## Herramientas utilizadas

| Herramienta | Aplicación en el proyecto |
|---|---|
| Microsoft SQL Server | Gestión y almacenamiento de la base de datos. |
| SQL Server Management Studio (SSMS) | Creación de tablas, carga de datos y ejecución de consultas SQL. |
| GitHub | Almacenamiento, organización y versionado de los archivos del proyecto. |
| Microsoft Power BI Desktop | Modelado de datos, relaciones, medidas DAX y preparación del análisis visual. |
| ChatGPT | Asistencia en documentación, revisión de consultas y generación de insights. |

## Estructura del repositorio

| Archivo | Descripción |
|---|---|
| `ventas_tech_db.sql` | Creación de la base de datos Ventas_Tech_DB, definición de tablas y carga de datos iniciales. |
| `m4_consultas_negocio.sql` | Consultas de análisis comercial: resumen mensual, ranking de productos y clientes recurrentes. |
| `m5_consultas_joins.sql` | Consultas con INNER JOIN, LEFT JOIN y UNION ALL para enriquecer el análisis. |
| `Marcaccio_Fiorella_Checkpoint2.pbix` | Archivo de Power BI con el modelo de datos y las medidas DAX. |

## Modelo de datos

La base de datos utilizada es `Ventas_Tech_DB` y contiene cuatro tablas principales:

- **categorias:** almacena las categorías de productos.
- **clientes:** contiene la información de los clientes.
- **productos:** registra los productos y su relación con las categorías.
- **ventas:** almacena las operaciones comerciales, incluyendo cliente, producto, cantidad, precio unitario y fecha de venta.

El modelo establece relaciones entre las tablas mediante identificadores, evitando duplicaciones innecesarias y facilitando las consultas.

## Análisis realizado con SQL

Se desarrollaron consultas para responder preguntas relevantes del negocio:

- Resumen ejecutivo mensual: facturación, cantidad de pedidos y ticket promedio.
- Ranking de productos según unidades vendidas y facturación generada.
- Identificación de clientes sin compras.
- Identificación de productos sin ventas.
- Integración de ventas, clientes, productos y categorías mediante JOIN.
- Comparación de facturación entre dos períodos utilizando UNION ALL.

## Modelo y análisis en Power BI

Se preparó un modelo de datos con una tabla de hechos de ventas y dimensiones de clientes, productos, categorías y fechas.

Se incorporaron medidas DAX para analizar:

- Total de ventas.
- Ventas del canal Online.
- Ventas acumuladas del año (YTD).
- Ventas del año anterior (LY).
- Porcentaje de crecimiento anual.

El objetivo es facilitar el análisis temporal y comercial a través de un modelo organizado y reutilizable.

## Cómo ejecutar los scripts SQL

Para ejecutar los archivos SQL se necesita Microsoft SQL Server y SQL Server Management Studio (SSMS).

**Paso 1. Preparar el entorno**

1. Abrir SQL Server Management Studio.
2. Conectarse a una instancia de SQL Server.
3. Descargar los archivos `.sql` desde este repositorio.

**Paso 2. Crear la base de datos**

1. Abrir el archivo `ventas_tech_db.sql`.
2. Ejecutar el script completo mediante el botón Execute (Ejecutar).
3. El script crea la base de datos `Ventas_Tech_DB`, genera las tablas e inserta los datos iniciales.

**Importante:** el script de creación elimina y vuelve a crear las tablas existentes para cargar los datos desde cero. Ejecutarlo nuevamente puede reemplazar los datos que se hayan incorporado después.

**Paso 3. Ejecutar las consultas de negocio**

1. Abrir `m4_consultas_negocio.sql`.
2. Verificar que la base de datos `Ventas_Tech_DB` esté disponible.
3. Ejecutar las consultas para obtener los indicadores comerciales.

**Paso 4. Ejecutar las consultas con JOIN**

1. Abrir `m5_consultas_joins.sql`.
2. Ejecutar el script para integrar las tablas y realizar los análisis correspondientes.

Se recomienda ejecutar primero el script de creación de la base de datos y luego los scripts de consultas, respetando ese orden.

## Archivo de Power BI

El repositorio también incluye el archivo `Marcaccio_Fiorella_Checkpoint2.pbix`, que contiene el modelo de datos y las medidas DAX desarrolladas para el análisis comercial.

Para continuar el análisis, descargar el archivo y abrirlo con Microsoft Power BI Desktop.

## Repositorio

[GitHub – data-analytics-practicas](https://github.com/fimarcaccio/data-analytics-practicas)

---

**Proyecto académico de análisis de datos – RetailPro**
