-- Create Database DWH_Project
CREATE DATABASE DWH_Project;

-- Create Table DimCustomer
CREATE TABLE DimCustomer (
    CustomerID int NOT NULL PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
	Age int NOT NULL,
    Gender varchar(50) NOT NULL,
    City varchar(50) NOT NULL,
	NoHP varchar(50) NOT NULL,
);

-- Create Table DimProduct
CREATE TABLE DimProduct (
    ProductID int NOT NULL PRIMARY KEY,
    ProductName varchar(255) NOT NULL,
    ProductCategory varchar(255) NOT NULL,
	ProductUnitPrice int,
);

-- Create Table DimStatusOrder
CREATE TABLE DimStatusOrder (
    StatusID int NOT NULL PRIMARY KEY,
    StatusOrder varchar(50) NOT NULL,
	StatusOrderDesc varchar(50) NOT NULL,
);

-- Create Table FactSalesOrder
CREATE TABLE FactSalesOrder (
    OrderID int NOT NULL PRIMARY KEY,
	 CustomerID int NOT NULL,
	 ProductID int NOT NULL,
	 Quantity int NOT NULL,
	 Amount int NOT NULL,
	 StatusID int NOT NULL,
	 OrderDate date NOT NULL,
	 CONSTRAINT FK_CustomerOrder FOREIGN KEY (CustomerID)
     REFERENCES DimCustomer(CustomerID),
	 CONSTRAINT FK_ProductOrder FOREIGN KEY (ProductID)
     REFERENCES DimProduct(ProductID),
	 CONSTRAINT FK_StatusOrder FOREIGN KEY (StatusID)
     REFERENCES DimStatusOrder(StatusID)
);

SELECT * FROM DimCustomer;
SELECT * FROM DimProduct;
SELECT * FROM DimStatusOrder;
SELECT * FROM FactSalesOrder;


-- Create Store Procedure
CREATE PROCEDURE summary_order_status
    @StatusID INT
AS
BEGIN
    SELECT
        fso.OrderID,
        dc.CustomerName,
        dp.ProductName,
        fso.Quantity,
        dso.StatusOrder
    FROM FactSalesOrder fso
    JOIN DimCustomer dc ON fso.CustomerID = dc.CustomerID
    JOIN DimProduct dp ON fso.ProductID = dp.ProductID
    JOIN DimStatusOrder dso ON fso.StatusID = dso.StatusID
    WHERE dso.StatusID = @StatusID;
END;

EXEC summary_order_status @StatusID = 1;
