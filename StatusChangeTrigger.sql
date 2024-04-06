Use TechLib
create Table AuditLog
(	
	BookId int,
	ISBN varchar(17),
	OldStatus varchar(20) check (OldStatus in ('Borrowed', 'Available')),
	NewStatus varchar(20) check (NewStatus in ('Borrowed', 'Available')),
	ChangeDate date
);

GO

CREATE TRIGGER TR_BookStatusChanged
ON Book 
AFTER UPDATE
AS
BEGIN
	DECLARE @OldStatus NVARCHAR(50)
    DECLARE @NewStatus NVARCHAR(50)

	Select @OldStatus = CurrentStatus from deleted
    SELECT @NewStatus = CurrentStatus FROM inserted

    BEGIN
        INSERT INTO dbo.AuditLog (BookId, ISBN, OldStatus, NewStatus, ChangeDate)
        select i.Id, i.ISBN, @OldStatus, @NewStatus, CAST(GETDATE() as date)
        FROM inserted i
    END
END
