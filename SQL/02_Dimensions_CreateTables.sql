-- creamos una nueva base de datos que será el datamart
CREATE DATABASE dw_superstore

-- creamos las TABLAS DIMENSIONES para hacer el modelo estrella --
USE dw_superstore
-- DimCustomer
CREATE TABLE dbo.DimCustomer (
    CustomerKey     INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID      NVARCHAR(50),
    CustomerName    NVARCHAR(100)
);

-- DimProduct
CREATE TABLE dbo.DimProduct (
    ProductKey      INT IDENTITY(1,1) PRIMARY KEY,
    ProductID       NVARCHAR(50),
    ProductName     NVARCHAR(255),
    Category        NVARCHAR(50),
    SubCategory     NVARCHAR(50)
);

-- DimGeography
CREATE TABLE dbo.DimGeography (
    GeographyKey    INT IDENTITY(1,1) PRIMARY KEY,
    City            NVARCHAR(100),
    State           NVARCHAR(50),
    Country         NVARCHAR(50),
    Region          NVARCHAR(50)
);

-- DimSegment
CREATE TABLE dbo.DimSegment (
    SegmentKey      INT IDENTITY(1,1) PRIMARY KEY,
    Segment         NVARCHAR(50)
);

-- DimDate
CREATE TABLE dbo.DimDate (
    DateKey         INT PRIMARY KEY,      -- formato YYYYMMDD
    FullDate        DATE,
    Year            INT,
    Month           INT,
    MonthName       NVARCHAR(20),
    Day             INT,
    WeekNum         INT,
    Quarter         INT
);

-- DimShippingMode
CREATE TABLE dbo.DimShippingMode (
    ShipModeKey     INT IDENTITY(1,1) PRIMARY KEY,
    ShipMode        NVARCHAR(50)
);

-- DimDiscountRange (opcional)
CREATE TABLE dbo.DimDiscountRange (
    DiscountRangeKey INT IDENTITY(1,1) PRIMARY KEY,
    DiscountRange    NVARCHAR(50)
);

-- DimProfitability (opcional)
CREATE TABLE dbo.DimProfitability (
    ProfitabilityKey INT IDENTITY(1,1) PRIMARY KEY,
    ProfitRange      NVARCHAR(50)
);


-- poblamos la tabla de fechas con información

-- Rango de fechas
DECLARE @StartDate DATE = '2010-01-01';
DECLARE @EndDate   DATE = '2030-12-31';

-- Limpiar tabla si ya existe
TRUNCATE TABLE dbo.DimDate;

;WITH DateSequence AS (
    SELECT @StartDate AS FullDate
    UNION ALL
    SELECT DATEADD(DAY, 1, FullDate)
    FROM DateSequence
    WHERE FullDate < @EndDate
)
INSERT INTO dbo.DimDate (
    DateKey,
    FullDate,
    Year,
    Month,
    MonthName,
    Day,
    WeekNum,
    Quarter
)
SELECT
    CONVERT(INT, FORMAT(FullDate, 'yyyyMMdd')) AS DateKey,
    FullDate,
    YEAR(FullDate),
    MONTH(FullDate),
    DATENAME(MONTH, FullDate),
    DAY(FullDate),
    DATEPART(WEEK, FullDate),
    DATEPART(QUARTER, FullDate)
FROM DateSequence
OPTION (MAXRECURSION 0);
