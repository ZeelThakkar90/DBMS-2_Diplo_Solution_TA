-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269
--[note: 'Go' keyword is for mac users only !]
--LAb: 9
--Execute Static Cursor
-- 1. Write T - SQL block to perform Static cursor. (A)
-- Create sample table
CREATE TABLE Employee (
    EmpID INT,
    EmpName NVARCHAR(50)
)

-- Insert sample data
INSERT INTO Employee VALUES (1, 'John'), (2, 'Jane'), (3, 'Alice')

DECLARE @EmpID INT, @EmpName NVARCHAR(50)
DECLARE emp_cursor STATIC CURSOR FOR
SELECT EmpID, EmpName FROM Employee

OPEN emp_cursor

FETCH NEXT FROM emp_cursor INTO @EmpID, @EmpName

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'EmpID: ' + CAST(@EmpID AS VARCHAR) + ', Name: ' + @EmpName
    FETCH NEXT FROM emp_cursor INTO @EmpID, @EmpName
END

CLOSE emp_cursor
DEALLOCATE emp_cursor
GO
-- 2. Write T - SQL block to perform static cursor that fetches first and last value from the result set. (B)
-- Declare variables
DECLARE @EmpID INT, @EmpName NVARCHAR(50)

-- Declare static cursor
DECLARE emp_cursor STATIC CURSOR FOR
SELECT EmpID, EmpName FROM Employee ORDER BY EmpID

-- Open cursor
OPEN emp_cursor

-- Fetch FIRST
FETCH FIRST FROM emp_cursor INTO @EmpID, @EmpName
PRINT 'First Record -> EmpID: ' + CAST(@EmpID AS VARCHAR) + ', Name: ' + @EmpName

-- Fetch LAST
FETCH LAST FROM emp_cursor INTO @EmpID, @EmpName
PRINT 'Last Record -> EmpID: ' + CAST(@EmpID AS VARCHAR) + ', Name: ' + @EmpName

-- Clean up
CLOSE emp_cursor
DEALLOCATE emp_cursor
GO
-- 3. Write T -SQL block to perform static cursor and try to insert/update/delete a record on table. (C)
-- Declare variables
DECLARE @EmpID INT, @EmpName VARCHAR(50)

-- Declare static cursor
DECLARE emp_cursor STATIC CURSOR FOR
SELECT EmpID, EmpName FROM Employee

-- Open cursor
OPEN emp_cursor

-- Fetch first row
FETCH NEXT FROM emp_cursor INTO @EmpID, @EmpName

-- Try performing DML operations while cursor is open
BEGIN TRY
    -- This might not affect the current cursor because static cursors use a snapshot
    UPDATE Employee SET EmpName = 'Updated' WHERE EmpID = 1
    INSERT INTO Employee VALUES (4, 'NewEmp')
    DELETE FROM Employee WHERE EmpID = 2

    PRINT 'Insert/Update/Delete operations completed while cursor is open.'
END TRY
BEGIN CATCH
    PRINT 'Error during DML operation.'
    PRINT ERROR_MESSAGE()
END CATCH

-- Clean up
CLOSE emp_cursor
DEALLOCATE emp_cursor
