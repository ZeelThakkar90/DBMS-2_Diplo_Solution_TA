-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269

-- Lab:3
--Implement T-SQL block for Conditional and Iterative statements

-- 1. Write a T - SQL block to check whether the given number is a positive number or a negative number using a simple if statement. (A)
DECLARE @num int= -2;
if @num>0
    PRINT 'Number is positive !';
ELSE
    PRINT 'Number is Negative !';

-- 2. Write a T - SQL block to Find the maximum of two numbers (A)
DECLARE @n1 INT = 2;
DECLARE @n2 INT = 3;

IF @n1>@n2
    PRINT 'maximum number is :'+ cast(@n1 as varchar);
ELSE
    PRINT 'maximum number is :'+ cast(@n2 as varchar);

-- 3. Write a T - SQL block to Find the maximum of three numbers (A)
DECLARE @a int =10, @b int = 20, @c int =30 ;

if @a>@b and @a>@c
    PRINT 'maximum number is :'+ cast(@a as varchar);
Else IF @b>@a and @b>@c
    PRINT 'maximum number is :'+ cast(@b as varchar);
ELSE
    PRINT 'maximum number is :'+ cast(@c as varchar);

-- 4. Write a T - SQL block to Print first 25 natural numbers using a loop (A)
DECLARE @i int =1

while @i<=25
BEGIN

    PRINT CAST(@i as varchar);
    SET @i = @i +1 ;
END

-- 5. Write a T - SQL block to Print odd numbers from 1 to 100 (A)
Declare @p int =1

while @p<=100
BEGIN
    IF @p%2=1
        PRINT @p;
        set @p =@p+1;
END
-- 6. Write a T - SQL block to Find the sum of first 100 natural numbers (B)
DECLARE @natural_number int =1, @sum INT=0;

while @natural_number<=100
BEGIN
   set @sum =@sum+@natural_number;
   set @natural_number=@natural_number+1;
END
print 'Sum = '+ CAST(@sum as varchar);

-- 7. Write a T - SQL block to Check whether a number is even or odd (B)
DECLARE @number7 int = 20;
if @number7 %2 =0
    print 'number is even :' + CAST(@number7 as varchar) ;
ELSE
    print 'number is odd :' + CAST(@number7 as varchar) ;

-- 8. Write a T - SQL block to Print first 25 odd numbers in reverse order (C)
DECLARE @num_reverse_print int =49;
while @num_reverse_print >= 1
BEGIN
    PRINT @num_reverse_print;
    SET @num_reverse_print = @num_reverse_print - 2 ;
END
-- 9. Write a T - SQL block to Print class based on marks (C)
DECLARE @mark int = 95;

IF @mark >70
    PRINT '1st Class';
ELSE If @mark <= 70 and @mark>50
    PRINT '2nd Class';
ELSE IF @mark>=35 and @mark<=50
    PRINT '3nd Class';
ELSE 
    PRINT 'Fail'

    