-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269
--[note: 'Go' keyword is for mac users only !]

--LAb: 10
-- Execute Dynamic Cursor
-- 1. Write T - SQL block to perform Dynamic cursor. (A)
-- Create sample table
CREATE TABLE Product (
    ProductID INT,
    ProductName NVARCHAR(50)
)

-- Insert sample data
INSERT INTO Product VALUES (1, 'Pen'), (2, 'Notebook'), (3, 'Eraser')

-- Declare variables
DECLARE @ProductID INT, @ProductName NVARCHAR(50)

-- Declare dynamic cursor
DECLARE product_cursor  CURSOR DYNAMIC FOR
SELECT ProductID, ProductName FROM Product

-- Open the cursor
OPEN product_cursor

-- Fetch and print each row
FETCH NEXT FROM product_cursor INTO @ProductID, @ProductName
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ProductID: ' + CAST(@ProductID AS VARCHAR) + ', Name: ' + @ProductName
    FETCH NEXT FROM product_cursor INTO @ProductID, @ProductName
END

-- Clean up
CLOSE product_cursor
DEALLOCATE product_cursor

GO
-- 2. Write T- SQL block to perform Dynamic cursor that fetch value and print that value after some delay.(B)
-- Declare variables
DECLARE @ProductID INT, @ProductName NVARCHAR(50)

-- Declare dynamic cursor
DECLARE product_cursor  CURSOR DYNAMIC FOR
SELECT ProductID, ProductName FROM Product

-- Open the cursor
OPEN product_cursor

-- Fetch and print each row with delay
FETCH NEXT FROM product_cursor INTO @ProductID, @ProductName
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ProductID: ' + CAST(@ProductID AS VARCHAR) + ', Name: ' + @ProductName

    --Delay of 2 seconds (2000 milliseconds)
    -- WAITFOR DELAY '00:00:02'

    FETCH NEXT FROM product_cursor INTO @ProductID, @ProductName
END

-- Clean up
CLOSE product_cursor
DEALLOCATE product_cursor
