# Data Warehouse and ETL Implementation
Data Engineer at ID/X Partners
![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/b1a4f73d-ae02-418e-a5b8-c81756fc139c)

## Case Study
- 1. Restore Database
- 2. Create Table Fact and Dimension
- 3. Create ETL Process / Data Pipeline
- 4. Create Store Procedure

## 1. Restore Database Staging
The first step is to restore the staging.bak database. To do so, see the image below.
- Restore Database
  - [image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/efed72ed-9512-4fa7-8234-0f7804f68f55)
- Result Restore Database
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/ec3f4c7e-c285-42c6-9691-90455a90adea)

## 2. Create Table Fact and Dimension
The next step is to create the DWH_Project database. Then in the database create a table DimCustomer, DimProduct, DimStatusOrder and FactSalesOrder.
- Create Database DWH_Project
  ```bash
  CREATE DATABASE DWH_Project;
  ```
- Create Table DimCustomer
  ```bash
  CREATE TABLE DimCustomer (
    CustomerID int NOT NULL PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
	 Age int NOT NULL,
    Gender varchar(50) NOT NULL,
    City varchar(50) NOT NULL,
	NoHP varchar(50) NOT NULL,
  );
  ```
- Create Table DimProduct
  ```bash
  CREATE TABLE DimProduct (
    ProductID int NOT NULL PRIMARY KEY,
    ProductName varchar(255) NOT NULL,
    ProductCategory varchar(255) NOT NULL,
	ProductUnitPrice int,
  );
  ```
- Create Table DimStatusOrder
  ``` bash
  CREATE TABLE DimStatusOrder (
    StatusID int NOT NULL PRIMARY KEY,
    StatusOrder varchar(50) NOT NULL,
	StatusOrderDesc varchar(50) NOT NULL,
  );
  ```
- Create Table FactSalesOrder
  ``` bash
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
  ```
- Result
  ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/2cb51914-4d04-4c4e-a385-5989f54b14e5)



