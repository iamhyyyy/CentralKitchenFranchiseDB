/* ============================= */
/* 8. DELIVERY METHOD (SUB)      */
/* ============================= */
CREATE TABLE DeliveryMethodHuyNV (
    DeliveryMethodId INT IDENTITY PRIMARY KEY,
    MethodName NVARCHAR(150),
    Description NVARCHAR(500),
    IsActive BIT
);


/* ============================= */
/* 8. DELIVERY (MAIN)            */
/* ============================= */
CREATE TABLE DeliveryHuyNV (
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

    FOREIGN KEY (OrderId) 
        REFERENCES OrderHeader(OrderId),

    FOREIGN KEY (DeliveryMethodId) 
        REFERENCES DeliveryMethodHuyNV(DeliveryMethodId)
);
