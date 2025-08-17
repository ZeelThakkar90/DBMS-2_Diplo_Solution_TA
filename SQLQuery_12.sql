-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269

--LAb: 12
-- Perform TCL and DCL commands
-- 1. Perform queries for SAVEPOINT, ROLLBACK and COMMIT commands on Customer_Master table.(A)
BEGIN TRANSACTION

-- Step 1: Insert a new customer
INSERT INTO Customer_Master (Cust_ID, Cust_FullName, Cust_DOB, Cust_Address, Cust_MobileNo, Cust_EmailID, Cust_City)
VALUES (101, 'Ravi Kumar', '1990-05-12', 'Mumbai', '9876543210', 'ravi@example.com', 'Mumbai')

-- Create savepoint
SAVE TRANSACTION Cust_Savepoint

-- Step 2: Update customer address
UPDATE Customer_Master
SET Cust_Address = 'Pune'
WHERE Cust_ID = 101

-- Rollback to savepoint (Undo address update but keep insert)
ROLLBACK TRANSACTION Cust_Savepoint

-- Commit transaction (Insert will remain)
COMMIT TRANSACTION

-- 2. Perform queries for GRANT and REVOKE command on Employee_Master. (A)

-- -- Grant SELECT and UPDATE permissions on Employee_Master to user 'user1'
-- GRANT SELECT, UPDATE ON Employee_Master TO user1;

-- -- Revoke UPDATE permission from user 'user1'
-- REVOKE UPDATE ON Employee_Master FROM user1;

-- 3. Perform queries for SAVEPOINT, ROLLBACK and COMMIT commands on Transaction_Master table.(B)
BEGIN TRANSACTION

-- Step 1: Insert a new transaction
INSERT INTO Transaction_Master (Tran_ID, Tras_Acc_No, Tran_Date, Tran_Type, Tran_Amount_Debit_Credit, Tran_Amount)
VALUES (201, 10001, GETDATE(), 'CH', 'D', 5000)

-- Create savepoint
SAVE TRANSACTION Tran_Savepoint

-- Step 2: Insert another transaction
INSERT INTO Transaction_Master (Tran_ID, Tras_Acc_No, Tran_Date, Tran_Type, Tran_Amount_Debit_Credit, Tran_Amount)
VALUES (202, 10001, GETDATE(), 'OL', 'C', 8000)

-- Rollback second insert
ROLLBACK TRANSACTION Tran_Savepoint

-- Commit (Only the first insert remains)
COMMIT TRANSACTION

-- 4. Perform queries for GRANT and REVOKE command on Account_Master table. (B)
-- Grant INSERT and SELECT permissions to user 'user2'
GRANT INSERT, SELECT ON Account_Master TO user2;

-- Revoke INSERT permission from user 'user2'
REVOKE INSERT ON Account_Master FROM user2;
