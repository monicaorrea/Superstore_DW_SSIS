# 🏗️ Data Warehouse Architecture – Superstore DW

Este documento describe la arquitectura del Data Warehouse desarrollado para el dataset Superstore. Incluye el modelo dimensional, las tablas, sus claves y las relaciones entre ellas.

---

## 📌 Enfoque del modelo
El DW sigue un **modelo en estrella (Star Schema)**, con una tabla de hechos central y varias dimensiones que aportan contexto analítico.

---

# ⭐ Tabla de Hechos

## **FactSales**
Contiene el detalle transaccional de ventas.

| Columna           | Tipo         | Descripción |
|------------------|--------------|-------------|
| SalesID (PK)     | INT IDENTITY | Clave surrogate |
| CustomerID (FK)  | INT          | Relación con DimCustomer |
| ProductID (FK)   | INT          | Relación con DimProduct |
| OrderDateKey (FK)| INT          | Relación con DimDate |
| GeographyID (FK) | INT          | Relación con DimGeography |
| SegmentID (FK)   | INT          | Relación con DimSegment |
| ShippingModeID(FK)| INT         | Relación con DimShippingMode |
| DiscountRangeID(FK)| INT        | Relación con DimDiscountRange |
| ProfitabilityID(FK)| INT        | Relación con DimProfitability |
| SalesAmount      | DECIMAL      | Importe de la venta |
| Quantity         | INT          | Unidades vendidas |
| LoadDate         | DATETIME2    | Fecha de carga ETL |

---

# ⭐ Dimensiones

## **DimCustomer**
| Columna | Tipo | Descripción |
|---------|------|-------------|
| CustomerID (PK) | INT | Clave surrogate |
| CustomerName | NVARCHAR | Nombre del cliente |
| LoadDate | DATETIME2 | Fecha de carga |

## **DimProduct**
| Columna | Tipo |
|---------|------|
| ProductID (PK) | INT |
| ProductName | NVARCHAR |
| Category | NVARCHAR |
| SubCategory | NVARCHAR |
| LoadDate | DATETIME2 |

## **DimGeography**
| Columna | Tipo |
|---------|------|
| GeographyID (PK) | INT |
| Country | NVARCHAR |
| State | NVARCHAR |
| City | NVARCHAR |
| Region | NVARCHAR |
| LoadDate | DATETIME2 |

## **DimSegment**
| Columna | Tipo |
|---------|------|
| SegmentID (PK) | INT |
| SegmentName | NVARCHAR |
| LoadDate | DATETIME2 |

## **DimShippingMode**
| Columna | Tipo |
|---------|------|
| ShippingModeID (PK) | INT |
| ShippingMode | NVARCHAR |
| LoadDate | DATETIME2 |

## **DimDiscountRange**
| Columna | Tipo |
|---------|------|
| DiscountRangeID (PK) | INT |
| DiscountRange | NVARCHAR |
| LoadDate | DATETIME2 |

## **DimProfitability**
| Columna | Tipo |
|---------|------|
| ProfitabilityID (PK) | INT |
| ProfitabilityLevel | NVARCHAR |
| LoadDate | DATETIME2 |

## **DimDate**
| Columna | Tipo |
|---------|------|
| DateKey (PK) | INT |
| FullDate | DATE |
| Year | INT |
| Month | INT |
| Day | INT |

> Esta dimensión no lleva LoadDate porque representa el calendario.

---

# ⭐ Relaciones del modelo

- FactSales se relaciona con todas las dimensiones mediante claves surrogate.
- El modelo está optimizado para análisis de ventas, segmentación, rentabilidad y geografía.

---

# 📌 Diagrama del modelo
Pendiente incluir imagen del modelo

