/* ============================= */
/* 7. ORDER STATUS (SUB)         */
/* ============================= */
CREATE TABLE OrderStatusLamNQ (
    OrderStatusLamNQId INT IDENTITY PRIMARY KEY,
    StatusName NVARCHAR(100),
    Description NVARCHAR(500),
    IsActive BIT
);

/* ============================= */
/* 7. ORDER HEADER (MAIN)        */
/* ============================= */
CREATE TABLE OrderHeaderLamNQ (
    OrderLamNQId INT IDENTITY PRIMARY KEY,
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
    OrderStatusLamNQId INT NOT NULL,
    FOREIGN KEY (FranchiseStoreId)
        REFERENCES FranchiseStorePhucBHV(FranchiseStoreId),
    FOREIGN KEY (ProductKietDTId)
        REFERENCES ProductKietDT(ProductKietDTId),
    FOREIGN KEY (OrderStatusLamNQId)
        REFERENCES OrderStatusLamNQ(OrderStatusLamNQId)
);