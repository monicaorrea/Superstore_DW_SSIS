CREATE DATABASE stg_superstore

-- creamos la tabla de stg en la bd con tipo varchar para que no de errores
USE stg_superstore;
CREATE TABLE stg_superstore (
    RowID INT,
    OrderID NVARCHAR(20),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode NVARCHAR(50),
    CustomerID NVARCHAR(20),
    CustomerName NVARCHAR(255),
    Segment NVARCHAR(50),
    Country NVARCHAR(50),
    City NVARCHAR(100),
    State NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Region NVARCHAR(50),
    ProductID NVARCHAR(50),
    Category NVARCHAR(50),
    SubCategory NVARCHAR(50),
    ProductName NVARCHAR(255),
    Sales DECIMAL(18,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(18,2)
);