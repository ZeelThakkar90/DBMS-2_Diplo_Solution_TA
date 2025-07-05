-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269
--[ Note: 'Go' keyword should be used for mac users only , as it gives error such as 'There can be only one procedure in a block !' so avoid it if using windows ]

-- Lab:6
-- Demonstrate Stored Procedure

-- 1. Write a stored procedure to and the Factorial. (A)
CREATE procedure PR_FACTORIAL_DEMO
(@num int)
AS
BEGIN
    declare @i int =1, @result int =1;
    WHILE @i<=@num
    BEGIN
        SET @result= @result*@i;
        SET @i =@i+1
    END
    PRINT @result;
END;
GO

exec PR_FACTORIAL_DEMO 5 ;
GO
-- 2. Write a stored procedure to find and maximum number out of two numbers. (A)
CREATE PROCEDURE PR_FIND_MAX
(@n1 int , @n2 int)
AS
BEGIN
    IF @n1>@n2
        PRINT 'maximum number is :' +CAST(@n1 as varchar);
    ELSE
        PRINT 'maximum number is :' +CAST(@n2 as varchar);     
END;
GO

exec PR_FIND_MAX 100,20 ;
GO
-- 3. Write a stored procedure to find square of number. (B)
CREATE PROCEDURE PR_FIND_SQUARE
(@n1 int)
AS
BEGIN
    DECLARE @sqr INT= @n1 * @n1;
    PRINT 'Square of number '+cast(@n1 as varchar)+' is :'+CAST(@sqr as varchar)
END;
GO
EXEC PR_FIND_SQUARE 10 ;
GO
-- 4. Write a stored procedure to find and the sum of first 50 even numbers. (B)
CREATE PROCEDURE PR_SUM_OF_FIRST_EVEN_50_NUM
AS
BEGIN
    DECLARE 
    @i int =2,
    @count int =0,
    @sum int =0 ;

    while @count <=50
    BEGIN
        set @sum=@sum+@i;
        set @i=@i+2;
        set @count = @count+1;
    END;
    PRINT 'Sum is :'+ CAST(@sum as varchar)
END;
GO
exec PR_SUM_OF_FIRST_EVEN_50_NUM ;
GO
-- 5. Write a Stored Procedure that returns Total marks of  3 subjects using output parameter if marks of all 3 subject is >35 else return a proper message. (C)

CREATE PROCEDURE PR_CONDITIONAL_MARKS
(@M1 INT, @M2 INT, @M3 INT)
AS
BEGIN
    DECLARE @TOTAL INT = @M1+@M2+@M3;
    IF @M1>35 AND @M1>35 AND @M1>35
        PRINT 'TOTAL MARKS OF 3 SUBJECTS ARE :'+ CAST(@TOTAL AS VARCHAR);
    ELSE
        PRINT('One or more marks are less than or equal to 35. Cannot calculate total');
END;
GO
EXEC PR_CONDITIONAL_MARKS 35,45,89;
EXEC PR_CONDITIONAL_MARKS 90,90,90;
