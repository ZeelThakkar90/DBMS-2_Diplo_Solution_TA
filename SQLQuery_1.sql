-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269

-- Lab:1
-- Create table and apply Integrity Constraints

-- Create the following tables with apply constraints and insert a minimum of 10 records in each table except Table No.1
-- 1. Table No.1 - Bank_Master (Bank_ID (PK), Bank_Name, Bank_ShortName)
create table Bank_Master (
    Bank_ID int Primary KEY,
    Bank_Name varchar(50),
    Bank_ShortName varchar(20) 
)
-- 2. Table No.2 - Branch_Master (Branch_ID (PK), Branch_Name, Branch_IFSC (Unique), Bank_ID (FK))
CREATE TABLE Branch_Master (
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(100) NOT NULL,
    Branch_IFSC VARCHAR(15) UNIQUE NOT NULL,
    Bank_ID INT,
    FOREIGN KEY (Bank_ID) REFERENCES Bank_Master(Bank_ID)
);

-- 3. Table No.3 – Employee_Master (Emp_No (PK), Branch_IFSC (FK), Emp_FullName, Emp_Designation, Emp_Manager_No, Employee_Salary)
CREATE TABLE Employee_Master (
    Emp_No INT PRIMARY KEY,
    Branch_IFSC VARCHAR(15),
    Emp_FullName VARCHAR(100) NOT NULL,
    Emp_Designation VARCHAR(50),
    Emp_Manager_No INT,
    Employee_Salary DECIMAL(10, 2),
    FOREIGN KEY (Branch_IFSC) REFERENCES Branch_Master(Branch_IFSC)
);

-- 4. Table No.4 – Customer_Master (Cust_ID (PK), Cust_FullName, Cust_DOB, Cust_Address, Cust_MobileNo, Cust_EmailID,
-- Cust_City)
CREATE TABLE Customer_Master (
    Cust_ID INT PRIMARY KEY,
    Cust_FullName VARCHAR(100) NOT NULL,
    Cust_DOB DATE NOT NULL,
    Cust_Address VARCHAR(200),
    Cust_MobileNo VARCHAR(15) NOT NULL,
    Cust_EmailID VARCHAR(100),
    Cust_City VARCHAR(50)
);

-- 5. Table No.5 – Account_Master (Acc_No (PK), Cust_ID (FK), Acc_Type (Must Contain only values SB -> Saving, CR -> Current),
-- Branch_IFSC(FK))
CREATE table Account_Master(
    Acc_No int PRIMARY KEY,
    Cust_ID int,
    Branch_IFSC VARCHAR(15),
    Acc_Type varchar(2) check (Acc_Type in ('SB','CR'))
    FOREIGN key(Cust_ID) REFERENCES Customer_Master(Cust_ID),
    FOREIGN KEY(Branch_IFSC) REFERENCES Branch_Master(Branch_IFSC)
)
-- 6. Table No.6 – Transaction_Master (Tran_ID (PK), 
--Tras_Acc_No (FK), Tran_Date, Tran_Type (Must Contain only values CH ->
-- Cash, CQ -> Cheque, OL -> Online, RG -> RTGS),
-- Tran_Amount_Debit_Credit 
--(Must Contain only values D -> Debit, C -> Credit), Tran_Amount)
CREATE TABLE Transaction_Master (
    Tran_ID INT PRIMARY KEY,
    Tras_Acc_No INT,
    Tran_Date DATE NOT NULL,
    Tran_Type VARCHAR(2) CHECK (Tran_Type IN ('CH', 'CQ', 'OL', 'RG')),
    Tran_Amount_Debit_Credit CHAR(1) CHECK (Tran_Amount_Debit_Credit IN ('D', 'C')),
    Tran_Amount DECIMAL(12, 2),
    FOREIGN KEY (Tras_Acc_No) REFERENCES Account_Master(Acc_No)
);

--[Note: if you are giving FK then must include thatfield too inside the create query]
