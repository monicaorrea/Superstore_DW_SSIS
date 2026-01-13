use dw_superstore

-- Creamos TABLA DE HECHOS que conecta con todas las tablas de dimensiones --
CREATE TABLE dbo.FactSales (
    -- Clave sustituta
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,

    -- Claves foráneas hacia dimensiones
    CustomerKey        INT NOT NULL,
    ProductKey         INT NOT NULL,
    GeographyKey       INT NOT NULL,
    SegmentKey         INT NOT NULL,
    ShipModeKey        INT NULL,
    DiscountRangeKey   INT NULL,
    ProfitabilityKey   INT NULL,

    -- Claves de fecha (formato YYYYMMDD)
    OrderDateKey       INT NOT NULL,
    ShipDateKey        INT NOT NULL,

    -- Medidas numéricas
    Sales              DECIMAL(18,2),
    Profit             DECIMAL(18,2),
    Quantity           INT,
    Discount           DECIMAL(10,4),

    -- Claves foráneas
    CONSTRAINT FK_FactSales_DimCustomer
        FOREIGN KEY (CustomerKey) REFERENCES dbo.DimCustomer(CustomerKey),

    CONSTRAINT FK_FactSales_DimProduct
        FOREIGN KEY (ProductKey) REFERENCES dbo.DimProduct(ProductKey),

    CONSTRAINT FK_FactSales_DimGeography
        FOREIGN KEY (GeographyKey) REFERENCES dbo.DimGeography(GeographyKey),

    CONSTRAINT FK_FactSales_DimSegment
        FOREIGN KEY (SegmentKey) REFERENCES dbo.DimSegment(SegmentKey),

    CONSTRAINT FK_FactSales_DimShipMode
        FOREIGN KEY (ShipModeKey) REFERENCES dbo.DimShippingMode(ShipModeKey),

    CONSTRAINT FK_FactSales_DimDiscountRange
        FOREIGN KEY (DiscountRangeKey) REFERENCES dbo.DimDiscountRange(DiscountRangeKey),

    CONSTRAINT FK_FactSales_DimProfitability
        FOREIGN KEY (ProfitabilityKey) REFERENCES dbo.DimProfitability(ProfitabilityKey),

    CONSTRAINT FK_FactSales_DimDate_Order
        FOREIGN KEY (OrderDateKey) REFERENCES dbo.DimDate(DateKey),

    CONSTRAINT FK_FactSales_DimDate_Ship
        FOREIGN KEY (ShipDateKey) REFERENCES dbo.DimDate(DateKey)
);


