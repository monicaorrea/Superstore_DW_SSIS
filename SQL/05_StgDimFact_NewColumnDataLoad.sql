-- Añadimos columna de feche de carga a las tablas de stg, dimensiones y hechos

USE stg_superstore
ALTER TABLE dbo.STG_Superstore
ADD LoadDate DATETIME2 NULL;

USE dw_superstore
ALTER TABLE dbo.DimCustomer 
ADD LoadDate DATETIME2 NULL;

ALTER TABLE dbo.DimProduct 
ADD LoadDate DATETIME2 NULL;

ALTER TABLE dbo.DimGeography 
ADD LoadDate DATETIME2 NULL;

ALTER TABLE dbo.DimSegment 
ADD LoadDate DATETIME2 NULL;

ALTER TABLE dbo.DimShippingMode 
ADD LoadDate DATETIME2 NULL;

ALTER TABLE dbo.DimDiscountRange 
ADD LoadDate DATETIME2 NULL;

ALTER TABLE dbo.DimProfitability 
ADD LoadDate DATETIME2 NULL;

ALTER TABLE dbo.FactSales
ADD LoadDate DATETIME2 NULL;