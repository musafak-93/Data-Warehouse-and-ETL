# Data Engineer at ID/X Partners
## Data Warehouse and ETL Implementation
![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/b1a4f73d-ae02-418e-a5b8-c81756fc139c)

## Case Study
- 1. Restore Database
- 2. Create Table Fact and Dimension
- 3. Create ETL Process / Data Pipeline
- 4. Create Store Procedure

## 1. Restore Database Staging
The first step is to restore the staging.bak database. To do so, see the image below.
- Restore Database
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/6d336d29-58db-48fe-918f-bf6e7603f6b3)
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
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/2cb51914-4d04-4c4e-a385-5989f54b14e5)

## 3. Create ETL Process / Data Pipeline
The next step is to create a job in Talend using the tMSSqllinput and tMSSqlOutput components to move data from source (staging) to target (DWH_Project), and using tMap component for UPCASE in the DimCustomer table.
- Create DB Connections
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/252f1128-d928-4186-98e3-2bee8a88ca2b)

- Step 1
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/2db902f4-bcf9-44c4-b466-ec1e7216282e)

- Step 2
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/5aa81882-cbc4-4284-93a6-96d56261ade1)

- Result Connections
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/16965c71-9f9c-4b77-968a-2866f5eb7aa9)

- Retrieve Schema
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/82983331-fb09-4e5d-92cb-c411ce75acce)

- Checklist dbo
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/5b651536-5d76-4f26-ab27-2bf657f2dfc1)

- Create Job
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/8a1c2699-8cbd-45ce-a6c6-110b8be1a90f)

- Result Job
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/cf225179-01a9-484c-94e0-a01e83bf9d15)

- Enter the required components and connect them to each other, as well as configure the database on each component.
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/db605e03-0ec8-4461-9fc1-3f542be8dfab)

- The source and target database sections are configured as shown in the image below.
  - Database Source
    - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/ecda0829-a514-41fa-9779-415a7fa18818)

  - Database Target
    - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/db9e558b-d194-453b-8e71-ecaf6fe1581d)

- In the target database section, make sure the columns between source and target match the column names and data types, if you have already run the job by clicking Run.
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/861a6f6d-9087-4f61-a30f-1424dfb2a82c)

- Result table data after moving data from the staging Database to the DWH_Project Database.
  - ![image](https://github.com/musafak-93/Data-Warehouse-and-ETL/assets/62982123/fac1a6f9-7ac9-4055-bbea-e7c903bfde65)











