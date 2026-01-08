/* ============================= */
/* CREATE & USE DATABASE         */
/* ============================= */
IF DB_ID('CentralKitchenFranchiseDB') IS NOT NULL
BEGIN
    DROP DATABASE CentralKitchenFranchiseDB;
END
GO

CREATE DATABASE CentralKitchenFranchiseDB;
GO

USE CentralKitchenFranchiseDB;
GO

/* ============================= */
/* 1. VEHICLE BRAND (SUB)        */
/* ============================= */
CREATE TABLE VehicleBrandLamTT (
    VehicleBrandLamTTId INT IDENTITY PRIMARY KEY,
    BrandName NVARCHAR(150),
    Country NVARCHAR(100),
    IsActive BIT
);

/* ============================= */
/* 1. VEHICLE MODEL (MAIN)       */
/* ============================= */
CREATE TABLE VehicleModelLamTT (
    VehicleModelLamTTId INT IDENTITY PRIMARY KEY,
    ModelName NVARCHAR(150),
    Description NVARCHAR(500),
    EngineType NVARCHAR(100),
    ReleaseYear INT,
    Status INT,
    PublishDate DATE,
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    IsActive BIT,
    VehicleBrandLamTTId INT NOT NULL,
    FOREIGN KEY (VehicleBrandLamTTId) REFERENCES VehicleBrandLamTT(VehicleBrandLamTTId)
);

/* ============================= */
/* 2. PRODUCT CATEGORY     */
/* ============================= */
CREATE TABLE ProductCategoryKietDT (
    ProductCategoryKietDTId INT IDENTITY PRIMARY KEY,
    CategoryName NVARCHAR(150),
    Description NVARCHAR(500),
    IsActive BIT
);

/* ============================= */
/* 2. PRODUCT (MAIN)       */
/* ============================= */
CREATE TABLE ProductKietDT (
    ProductKietDTId INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(250),
    SKU NVARCHAR(100),
    Price DECIMAL(18,2),
    Unit NVARCHAR(50),
    Description NVARCHAR(MAX),
    WarrantyInfo NVARCHAR(500),
    Status INT,
    PublishDate DATE,
    CreatedDate DATETIME,
    IsActive BIT,
    ProductCategoryKietDTId INT NOT NULL,
    VehicleModelLamTTId INT NOT NULL,
    FOREIGN KEY (ProductCategoryKietDTId)
        REFERENCES ProductCategoryKietDT(ProductCategoryKietDTId),
    FOREIGN KEY (VehicleModelLamTTId)
        REFERENCES VehicleModelLamTT(VehicleModelLamTTId)
);

/* ============================= */
/* 3. VARIANT COLOR (SUB)        */
/* ============================= */
CREATE TABLE VariantColorHauPT (
    VariantColorId INT IDENTITY PRIMARY KEY,
    ColorName NVARCHAR(100),
    ColorCode NVARCHAR(20),
    IsActive BIT
);

/* ============================= */
/* 3. PRODUCT VARIANT (MAIN)     */
/* ============================= */
CREATE TABLE ProductVariantHauPT (
    ProductVariantId INT IDENTITY PRIMARY KEY,
    VariantName NVARCHAR(150),
    Price DECIMAL(18,2),
    SKU NVARCHAR(100),
    StockQuantity INT,
    ImageUrl NVARCHAR(1000),
    Description NVARCHAR(MAX),
    Status INT,
    PublishDate DATE,
    UpdatedDate DATETIME,
    IsActive BIT,
    ProductKietDTId INT NOT NULL,
    VariantColorId INT NOT NULL,
    FOREIGN KEY (ProductKietDTId) REFERENCES ProductKietDT(ProductKietDTId),
    FOREIGN KEY (VariantColorId) REFERENCES VariantColorHauPT(VariantColorId)
);

/* ============================= */
/* 4. KITCHEN TYPE (SUB)         */
/* ============================= */
CREATE TABLE KitchenTypeKhaiVPM (
    KitchenTypeKhaiVPMId INT IDENTITY PRIMARY KEY,
    TypeName NVARCHAR(150),
    Description NVARCHAR(500),
    IsActive BIT
);

/* ============================= */
/* 4. CENTRAL KITCHEN (MAIN)     */
/* ============================= */
CREATE TABLE CentralKitchenKhaiVPM (
    CentralKitchenKhaiVPMId INT IDENTITY PRIMARY KEY,
    KitchenName NVARCHAR(250),
    Address NVARCHAR(500),
    Capacity INT,
    OpenDate DATE,
    Status INT,
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    MonthlyCost DECIMAL(18,2),
    IsActive BIT,
    KitchenTypeKhaiVPMId INT NOT NULL,
    FOREIGN KEY (KitchenTypeKhaiVPMId) REFERENCES KitchenTypeKhaiVPM(KitchenTypeKhaiVPMId)
);

/* ============================= */
/* 5. STORE REGION (SUB)         */
/* ============================= */
CREATE TABLE StoreRegionPhucBHV (
    StoreRegionId INT IDENTITY PRIMARY KEY,
    RegionName NVARCHAR(150),
    Description NVARCHAR(500),
    IsActive BIT
);

/* ============================= */
/* 5. FRANCHISE STORE (MAIN)     */
/* ============================= */
CREATE TABLE FranchiseStorePhucBHV (
    FranchiseStoreId INT IDENTITY PRIMARY KEY,
    StoreName NVARCHAR(250),
    Address NVARCHAR(500),
    Phone NVARCHAR(50),
    Email NVARCHAR(150),
    OpeningDate DATE,
    Status INT,
    CreatedDate DATETIME,
    Revenue DECIMAL(18,2),
    IsActive BIT,
    StoreRegionId INT NOT NULL,
    CentralKitchenId INT NOT NULL,
    FOREIGN KEY (StoreRegionId) REFERENCES StoreRegionPhucBHV(StoreRegionId),
    FOREIGN KEY (CentralKitchenId) REFERENCES CentralKitchenKhaiVPM(CentralKitchenKhaiVPMId)
);

/* ============================= */
/* 6. INVENTORY LOCATION (SUB)   */
/* ============================= */
CREATE TABLE InventoryLocationHuyND (
    InventoryLocationHuyNDId INT IDENTITY PRIMARY KEY,
    LocationName NVARCHAR(150),
    Description NVARCHAR(500),
    IsActive BIT
);

/* ============================= */
/* 6. INVENTORY (MAIN)           */
/* ============================= */
CREATE TABLE InventoryHuyND (
    InventoryHuyNDId INT IDENTITY PRIMARY KEY,
    ItemName NVARCHAR(250),
    Quantity INT,
    Unit NVARCHAR(50),
    ExpiryDate DATE,
    BatchNumber NVARCHAR(100),
    Status INT,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
    Cost DECIMAL(18,2),
    IsActive BIT,
    CentralKitchenId INT NOT NULL,
    InventoryLocationHuyNDId INT NOT NULL,
    FOREIGN KEY (CentralKitchenId) REFERENCES CentralKitchenKhaiVPM(CentralKitchenKhaiVPMId),
    FOREIGN KEY (InventoryLocationHuyNDId) REFERENCES InventoryLocationHuyND(InventoryLocationHuyNDId)
);

/* ============================= */
/* 7. ORDER STATUS (SUB)         */
/* ============================= */
CREATE TABLE OrderStatus (
    OrderStatusId INT IDENTITY PRIMARY KEY,
    StatusName NVARCHAR(100),
    Description NVARCHAR(500),
    IsActive BIT
);

/* ============================= */
/* 7. ORDER HEADER (MAIN)        */
/* ============================= */
CREATE TABLE OrderHeader (
    OrderId INT IDENTITY PRIMARY KEY,
    OrderCode NVARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(18,2),
    Discount DECIMAL(18,2),
    Tax DECIMAL(18,2),
    FinalAmount DECIMAL(18,2),
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    IsActive BIT,
    FranchiseStoreId INT NOT NULL,
    ProductKietDTId INT NOT NULL,
    OrderStatusId INT NOT NULL,
    FOREIGN KEY (FranchiseStoreId) REFERENCES FranchiseStorePhucBHV(FranchiseStoreId),
    FOREIGN KEY (ProductKietDTId) REFERENCES ProductKietDT(ProductKietDTId),
    FOREIGN KEY (OrderStatusId) REFERENCES OrderStatus(OrderStatusId)
);

/* ============================= */
/* 8. DELIVERY METHOD (SUB)      */
/* ============================= */
CREATE TABLE DeliveryMethod (
    DeliveryMethodId INT IDENTITY PRIMARY KEY,
    MethodName NVARCHAR(150),
    Description NVARCHAR(500),
    IsActive BIT
);

/* ============================= */
/* 8. DELIVERY (MAIN)            */
/* ============================= */
CREATE TABLE Delivery (
    DeliveryId INT IDENTITY PRIMARY KEY,
    DeliveryCode NVARCHAR(100),
    DeliveryDate DATE,
    DeliveryCost DECIMAL(18,2),
    Address NVARCHAR(500),
    Status INT,
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    EstimatedTime INT,
    IsActive BIT,
    OrderId INT UNIQUE NOT NULL,
    DeliveryMethodId INT NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES OrderHeader(OrderId),
    FOREIGN KEY (DeliveryMethodId) REFERENCES DeliveryMethod(DeliveryMethodId)
);

