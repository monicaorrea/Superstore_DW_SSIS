# ⚙️ ETL Logic – Superstore Data Warehouse

Este documento describe la lógica ETL implementada para cargar el Data Warehouse Superstore utilizando SQL Server Integration Services (SSIS).

---

# 🧩 1. Arquitectura ETL

El proceso ETL se divide en tres fases:

1. **Extract** → Carga del archivo CSV a la tabla STG  
2. **Transform** → Limpieza, normalización y enriquecimiento  
3. **Load** → Carga de dimensiones y tabla de hechos  

---

# 🗂️ 2. Carga de Staging (STG)

## **STG_Superstore**
- Se carga desde el CSV original.
- Se aplican conversiones de tipo.
- Se añade columna `LoadDate = GETDATE()` mediante Derived Column.
- No tiene claves ni restricciones.

**Objetivo:** almacenar los datos tal cual llegan, pero tipados correctamente.

---

# 🧼 3. Transformaciones principales

### ✔ Limpieza de CustomerName  
- Eliminación de espacios  
- Normalización de mayúsculas/minúsculas  

### ✔ Cálculo de DiscountRange  
- Clasificación del descuento en rangos (0–10%, 10–20%, etc.)

### ✔ Cálculo de Profitability  
- Clasificación según margen (Profit / Sales)

### ✔ Conversión de fechas  
- Order Date → DateKey (INT AAAAMMDD)

---

# 🏗️ 4. Carga de Dimensiones

Cada dimensión tiene su propio paquete SSIS:

### 🔹 DimCustomer
- Se extraen valores únicos de STG.
- Se genera surrogate key (IDENTITY).
- Se añade LoadDate con GETDATE().

### 🔹 DimProduct  
Igual proceso, con Category y SubCategory.

### 🔹 DimGeography  
Se agrupan Country, State, City, Region.

### 🔹 DimSegment  
Valores únicos de Segment.

### 🔹 DimShippingMode  
Valores únicos de Ship Mode.

### 🔹 DimDiscountRange  
Generada a partir del cálculo de rangos.

### 🔹 DimProfitability  
Generada a partir del cálculo de rentabilidad.

### 🔹 DimDate  
Precargada con script SQL (no se carga desde SSIS).

---

# 📦 5. Carga de FactSales

- Se hace lookup a todas las dimensiones para obtener las surrogate keys.
- Se insertan las filas con:
  - CustomerID
  - ProductID
  - DateKey
  - GeographyID
  - SegmentID
  - ShippingModeID
  - DiscountRangeID
  - ProfitabilityID
  - SalesAmount
  - Quantity
  - LoadDate

---

# 🧹 6. Limpieza del DW antes de recargar

Se ejecuta el SP:
EXEC dbo.Clean_DW_ETL;


Este SP:

1. Borra FactSales  
2. Borra todas las dimensiones excepto DimDate  

---

# 🚀 7. Orden de ejecución del ETL

1. Ejecutar `Clean_DW_ETL`
2. Cargar STG
3. Cargar Dimensiones
4. Cargar FactSales
5. Validar con SELECT COUNT

---

# ✔ Estado del ETL
- 100% automatizado en SSIS  
- Trazabilidad mediante LoadDate  
- Modelo listo para análisis en Power BI  


