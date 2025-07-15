-- TA-Solution Diploma-sem-3 : Zeel Thakkar  23010101269
--[ Note: 'Go' keyword should be used for mac users only , as it gives error such as 'There can be only one Trigger in a block !' so avoid it if using windows ]

--LAb: 7. 
--Execute DDL Trigger

-- 1. Create a DDL Trigger for CREATE event and display message of successful event. (A)

CREATE OR ALTER  TRIGGER trg_OnCreateEvent
ON DATABASE
FOR CREATE_TABLE  
AS
BEGIN
    PRINT 'DDL Trigger: A CREATE statement was successfully executed.'
END
GO
-- 2. Create a DDL Trigger for ALTER event and display message of successful event.(A)

CREATE OR ALTER TRIGGER trg_OnAlterEvent
ON DATABASE
FOR ALTER_TABLE 
AS
BEGIN
    PRINT 'DDL Trigger: An ALTER statement was successfully executed.'
END
GO
-- 3. Create a DDL Trigger for DROP event and display message of successful event. (A)
CREATE OR ALTER TRIGGER tr_drop
ON Customer_Master
AFTER DELETE
AS
BEGIN
PRINT 'Record is Affected.'
END
GO
-- 4. Create a DDL Trigger for All three events using log table. (B)
create table ddl_demo(
    log_id int IDENTITY(1,1) primary key,
    event_value XML not null,
    event_date datetime not null,
    event_by varchar(20) not null
)
go
create trigger tr_all_event
on database 
for create_table, alter_table ,drop_table
as
begin 
    insert into ddl_demo (event_date,event_value,event_by) 
    VALUES (getdate(),eventdata(),user)
END


event_by -> user 
event_value -> EventData()

