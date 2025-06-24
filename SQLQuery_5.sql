-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269
--[ Note: Go should be used by mac users only ,as it gives error such as 'There can be only one Function in a block !' so avoid it if using windows ]

-- Lab:5
-- Demonstrate Function

-- 1. Create a function to calculate simple interest (SI=P*R*N/100). (A)
CREATE FUNCTION fn_CalculateSimpleInterest (
    @P FLOAT,
    @R FLOAT,
    @N FLOAT
)
RETURNS FLOAT
AS
BEGIN
    RETURN (@P * @R * @N) / 100;
END;
GO

SELECT dbo.fn_CalculateSimpleInterest(1000, 5, 2) AS SimpleInterest;
GO

-- 2. Create a function to and the feet to inch. (A)
CREATE FUNCTION fn_FeetToInch
(@Feet FLOAT)
RETURNS FLOAT
AS
BEGIN
    RETURN @Feet * 12;
END;
GO

-- 3. Create a function to convert Celsius to Fahrenheit. (B)
CREATE FUNCTION fn_CelsiusToFahrenheit (
    @Celsius FLOAT
)
RETURNS FLOAT
AS
BEGIN
    RETURN (@Celsius * 9.0 / 5.0) + 32;
END;
GO

SELECT dbo.fn_CelsiusToFahrenheit(37) AS Fahrenheit;
GO
-- 4. Create a function to and factorial of a number. (C)
CREATE FUNCTION fn_Factorial (
    @Num INT
)
RETURNS BIGINT
AS
BEGIN
    DECLARE @Result BIGINT = 1;
    DECLARE @i INT = 1;

    WHILE @i <= @Num
    BEGIN
        SET @Result = @Result * @i;
        SET @i = @i + 1;
    END

    RETURN @Result;
END;
GO

SELECT dbo.fn_Factorial(5) AS Factorial;
GO
-- 5. Write a function to and the sum of odd numbers between two range. (C)
CREATE FUNCTION dbo.fn_SumOddBetweenRange (
    @Start INT,
    @End INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Sum INT = 0;
    DECLARE @i INT = @Start;

    WHILE @i <= @End
    BEGIN
        IF @i % 2 = 1
            SET @Sum = @Sum + @i;
        SET @i = @i + 1;
    END

    RETURN @Sum;
END;
GO

SELECT dbo.fn_SumOddBetweenRange(1, 10) AS OddSum;
GO