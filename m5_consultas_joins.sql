-- ===========================================
--Base de datos: Ventas_Tech_DB
--Motor: Microsoft SQL Server
-- ===========================================
USE Ventas_Tech_DB;
GO
-- ===========================================
-- CONSULTA 1: VISTA BASE DEL PROYECTO (INNER JOIN)
-- Propósito: integrar ventas, clientes, productos y categorías en una única vista para el análisis en Power BI.
-- ===========================================

SELECT
    v.id_venta,
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;
GO

-- ===========================================
-- Hallazgo: las 10 ventas registradas se integran en una única vista, relacionando clientes, productos y categorías.
-- La ciudad permite analizar la distribución geográfica de las ventas en Power BI.
-- ===========================================
-- CONSULTA 2: CLIENTES SIN VENTAS (LEFT JOIN)
-- Propósito: identificar clientes registrados que nunca realizaron compras, para detectar oportunidades de CRM.
-- ===========================================

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;
GO

-- ===========================================
-- Hallazgo: La consulta devolvió 0 registros, no se encontraron clientes sin compras. 
-- El 100% de los clientes (5) registrados realizó al menos una compra. No hay inactivos.
-- ===========================================
-- CONSULTA 3: PRODUCTOS SIN VENTAS (LEFT JOIN)
-- Propósito: identificar productos del catálogo que todavía no tuvieron ventas.
-- ===========================================

SELECT
    p.nombre_producto,
    cat.nombre_categoria,
    p.precio
FROM productos p
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;
GO

-- ===========================================
-- Hallazgo: La consulta devolvió 0 registros. No se encontraron productos sin ventas.
-- Los seis productos del catálogo registraron al menos una operación.
-- ===========================================
-- CONSULTA 4: CONSOLIDACIÓN DE VENTAS CON UNION ALL
-- Propósito: comparar la facturación de dos períodos utilizando UNION ALL y una columna de clasificación.
-- Los períodos funcionan como categorías de análisis, no representan canales de venta reales.
-- ===========================================

SELECT
    canal,
    SUM(total) AS total_canal
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Primer período' AS canal
    FROM ventas
    WHERE fecha_venta >= '2024-03-05'
      AND fecha_venta <= '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Segundo período' AS canal
    FROM ventas
    WHERE fecha_venta >= '2024-03-11'
      AND fecha_venta <= '2024-03-15'
) AS consolidado
GROUP BY canal
ORDER BY canal;
GO

-- ===========================================
-- Hallazgo: El primer período registró una facturación de $3.620, mientras que el segundo alcanzó $2.824.
-- El primer período concentró aproximadamente el 56,18% de la facturación total analizada.
-- ===========================================
