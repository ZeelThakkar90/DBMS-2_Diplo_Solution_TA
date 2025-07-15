-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269
--[ Note: 'Go' keyword should be used for mac users only , as it gives error such as 'There can be only one Trigger in a block !' so avoid it if using windows ]
--LAb: 8
--Execute DML Trigger
-- 1. Create a DML After/For Trigger for INSERT event and display the message of the successful event. (A)
CREATE TRIGGER trg_AfterInsert_Customer
ON Customer_Master
AFTER INSERT
AS
BEGIN
    PRINT 'DML Trigger: A new customer record was successfully inserted.'
END
GO
-- 2. Create a DML After/For Trigger for the UPDATE event and display a message of the successful event. (A)
CREATE TRIGGER trg_AfterUpdate_Customer
ON Customer_Master
AFTER UPDATE
AS
BEGIN
    PRINT 'DML Trigger: A customer record was successfully updated.'
END
Go
-- 3. Create a DML After/For Trigger for the DELETE event and display the message of the successful event. (A)
CREATE TRIGGER trg_AfterDelete_Customer
ON Customer_Master
AFTER DELETE
AS
BEGIN
    PRINT 'DML Trigger: A customer record was successfully deleted.'
END

-- 4. Create a DML After/For Trigger for All three-event using log table. (B)
