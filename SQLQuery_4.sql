-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269

--[Note: Go is for mac usuers only to emit the error]

-- Lab:4
--Demonstrate View, Sequence and Synonym

-- 1. Create a simple view Bank_View which contains only Bank_ID and Bank_Name (A)
CREATE VIEW Bank_View AS
SELECT Bank_ID, Bank_Name
FROM Bank_Master;
GO
-- 2. Create a simple view Customer_View which contains Cust_FullName,Cust_MobileNo, Cust_EmailID (A)
CREATE view Customer_View
AS
SELECT Cust_FullName,Cust_MobileNo,Cust_EmailID
from Customer_Master;
GO

-- 3. Create a complex view that contains Acc_No, Cust_ID, Branch_Name, Bank_Name (A)
CREATE VIEW Account_Complex_View AS
SELECT a.Acc_No,a.Cust_ID,br.Branch_Name,b.Bank_Name
FROM Account_Master a inner JOIN Branch_Master br 
on a.Branch_IFSC = br.Branch_IFSC
inner join Bank_Master b 
ON br.Bank_ID = b.Bank_ID
GO

-- 4. Create a simple view with Check Option Cust_View which contains Cust_FullName, Cust_City (A)
CREATE VIEW Cust_View AS
SELECT Cust_FullName, Cust_City
FROM Customer_Master
WITH CHECK OPTION;
GO
-- 5. Create a sequence on the following table's listed columns: Bank_Master -> Bank_ID, Branch_Master -> Branch_ID,
-- Employee_Master -> Emp_No (A)
-- For Bank_Master
CREATE SEQUENCE Seq_Bank_ID
    START WITH 1
    INCREMENT BY 1;

-- For Branch_Master
CREATE SEQUENCE Seq_Branch_ID
    START WITH 1
    INCREMENT BY 1;

-- For Employee_Master
CREATE SEQUENCE Seq_Emp_No
    START WITH 1
    INCREMENT BY 1;

-- 6. Create Synonym T_Master for Transaction_Master. (A)
CREATE SYNONYM T_Master FOR dbo.Transaction_Master;
GO
-- 7. Create a simple view Tr_View which contains Tran_ID, Tras_Acc_No those whose Tran_Type is Online.(B)
CREATE view Tr_View
AS
SELECT Tran_ID,Tras_Acc_No
FROM Transaction_Master 
WHERE Tran_Type='OL'
GO
-- 8. Create whole view of the Custome_Master table with check option for customer city = 'Rajkot' and insert data using view.(B)
CREATE VIEW Rajkot_Cust_View AS
SELECT * FROM Customer_Master
WHERE Cust_City = 'Rajkot'
WITH CHECK OPTION;
GO
-- Insert example
INSERT INTO Rajkot_Cust_View (Cust_ID, Cust_FullName, Cust_City, Cust_MobileNo, Cust_EmailID)
VALUES (101, 'Nirav Patel', 'Rajkot', '9876543210', 'nirav@example.com');

-- 9. Create a one Table and create sequence for which contain start from 101 increment by 5 and maximum value is 120, minimum value is 100 and restart cycle after reach on maximum value. (B)
-- Create the table
CREATE TABLE Sample_Seq_Table (
    ID INT PRIMARY KEY,
    DataValue VARCHAR(50)
);

-- Create the sequence
CREATE SEQUENCE Seq_Custom_ID
    START WITH 101
    INCREMENT BY 5
    MINVALUE 100
    MAXVALUE 120
    CYCLE;

-- Insert using sequence
INSERT INTO Sample_Seq_Table (ID, DataValue)
VALUES (NEXT VALUE FOR Seq_Custom_ID, 'Test Entry');

-- 10. Insert one value into the Employee_Master table fetch next id from using sequence. (B)
INSERT INTO Employee_Master (Emp_No, Emp_Name)
VALUES (NEXT VALUE FOR Seq_Emp_No, 'Zeel Thakkar');
GO
-- 11. Alter Tr_View that also contains Tran_Amount column. (C)
ALTER VIEW Tr_View AS
SELECT Tran_ID, Tras_Acc_No, Tran_Amount
FROM Transaction_Master
WHERE Tran_Type = 'Online';
GO
-- 12. Drop the Customer_View. (C)
Drop VIEW Customer_View ;

-- 13. Drop the Employee_Master table sequence and try to insert data using sequence. (C)
-- Drop the sequence
DROP SEQUENCE Seq_Emp_No;
-- Attempting to insert now will fail:
 INSERT INTO Employee_Master (Emp_No, Emp_Name)
 VALUES (NEXT VALUE FOR Seq_Emp_No, 'ZTH');
-- -- Error: Invalid object name 'Seq_Emp_No'