-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269

--LAb: 11
-- Perform Exception Handling

-- 1. Write T-SQL block to perform System Defined Exception for data type conversion Exception. (A)
BEGIN TRY
    DECLARE @num INT
    SET @num = CAST('ABC' AS INT) -- Will throw conversion error
END TRY
BEGIN CATCH
    PRINT 'Error: Data type conversion failed.'
    PRINT ERROR_MESSAGE()
END CATCH
-- 2. Write T-SQL block to perform System Defined Exception for divide by 0. (A)
BEGIN TRY
    DECLARE @a int =10 , @b int =0 , @c INT
    SET @c = @a / @b ;
    PRINT @c ;
END TRY
BEGIN CATCH
    PRINT 'Divide by zero Expection';
    PRINT ERROR_MESSAGE();
END CATCH

-- 3. Write T-SQL to perform User Defined Exception.
-- If User enter age<14 then print the error message "Child labour is not legal". (A)
DECLARE @age int = 12;
BEGIN TRY
    IF @age<14
        THROW 50001, 'Child labour is not legal', 1 ;
    ELSE
        PRINT 'Age is acceptable' ;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

-- 4. Write T-SQL block to generate System Defined Exception for Check constraint violation. (B)
-- First, create a sample table with a CHECK constraint
CREATE TABLE Employees (
    ID INT,
    Age INT CHECK (Age >= 18)
)
BEGIN TRY
    -- This will violate the CHECK constraint
    INSERT INTO Employees (ID, Age) VALUES (1, 15)
END TRY
BEGIN CATCH
    PRINT 'Error: Check constraint violated.'
    PRINT ERROR_MESSAGE()
END CATCH
-- 5. Write T-SQL block to perform User Defined Exception if we try to delete data that is not available in table. (B)
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM Employees WHERE ID = 999)
        THROW 50002, 'Cannot delete: Record does not exist.', 1
    ELSE
        DELETE FROM Employees WHERE ID = 999
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH

-- 6. Write T- SQL block to generate System Defined Exception for primary key violation. (C)

-- Step 1: Create table with PRIMARY KEY
CREATE TABLE Students (
    RollNo INT PRIMARY KEY,
    Name NVARCHAR(50)
)
-- Step 2: Insert valid row
INSERT INTO Students VALUES (1, 'John')

-- Step 3: Insert duplicate RollNo to violate PK
BEGIN TRY
    INSERT INTO Students VALUES (1, 'Jane')
END TRY
BEGIN CATCH
    PRINT 'Error: Primary key violation.'
    PRINT ERROR_MESSAGE()
END CATCH

-- 7. Write T-SQL block to multiply three numbers and if any number is 0 then generate User Defined Exception. (C)
DECLARE @a1 INT = 5, @b1 INT = 0, @c1 INT = 10  ;
BEGIN TRY
    IF @a1 = 0 OR @b1 = 0 OR @c1 = 0
        THROW 50003, 'Multiplication with 0 is not allowed.', 1
    ELSE
        PRINT 'Result = ' + CAST(@a1 * @b1 * @c1 AS VARCHAR)
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH