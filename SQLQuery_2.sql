-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269

-- Lab:2
-- Implement the concept of join and subquery

-- 1. Display Employee number, name and branch name. (A)
SELECT e.Emp_No,e.Emp_FullName , b.Branch_name
from Employee_Master e inner join Branch_Master b
on e.Branch_IFSC=b.Branch_IFSC

-- 2. Display Account number, customer id, name and branch IFSC code using join. (A)
select a.Acc_No,c.Cust_ID,c.Cust_FullName,a.Branch_IFSC
from Customer_Master c inner join Account_Master a
on c.Cust_ID= a.Cust_ID

-- 3. Display Transaction ID, amount, account number, account type whose transaction type is Online. (A)
select t.Tran_ID,t.Tran_Amount,t.Tras_Acc_No,a.Acc_Type
from Transaction_Master t inner join Account_Master a
ON t.Tran_Amount =a.Acc_No

-- 4. Display Account number, type, transaction account number and amount using left outer join. (A)
SELECT a.Acc_No ,a.Acc_Type,t.Tras_Acc_No,t.Tran_Amount
from Account_Master a left OUTER JOIN Transaction_Master t
ON t.Tran_Amount =a.Acc_No


-- 5. Display Account number, type, transaction account number and amount using right outer join. (A)
SELECT a.Acc_No ,a.Acc_Type,t.Tras_Acc_No,t.Tran_Amount
from Account_Master a RIGHT OUTER JOIN Transaction_Master t
ON t.Tran_Amount =a.Acc_No

-- 6. Display customer name, mobile number who has highest transaction amount. (A)
SELECT C.Cust_FullName, C.Cust_MobileNo
FROM Customer_Master C
JOIN Account_Master A ON C.Cust_ID = A.Cust_ID
JOIN Transaction_Master T ON A.Acc_No = T.Tras_Acc_No
WHERE T.Tran_Amount = (
    SELECT MAX(Tran_Amount) FROM Transaction_Master
);

-- 7. Display Branch name, IFSC and Bank ID who has lowest paying amount employee. (A)
SELECT b.Branch_Name,b.Branch_IFSC,b.Bank_ID
from Branch_Master b inner join Employee_Master E 
on b.Branch_IFSC = E.Branch_IFSC
where e.Employee_Salary =(
    select MIN(Employee_Salary) from Employee_Master 
);

-- 8. Display the count of total designation of an employees. (A)
SELECT Emp_Designation, COUNT(Emp_No) AS Total
FROM Employee_Master
GROUP BY Emp_Designation;

-- 9. Display the count of how many customers have saving account. (A)
SELECT COUNT(DISTINCT Cust_ID) AS Saving_Account_Holders
FROM Account_Master
WHERE Acc_Type = 'SB';

-- 10. Display details of branch master branch name wise in descending order. (A)
SELECT * 
From Branch_Master
ORDER BY Branch_Name DESC           
