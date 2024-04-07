create procedure InsertNewBorrower
(@FirstName varchar(100), @LastName varchar(100), @Email varchar(100), @DateOfBirth Date)
as
begin

	select Email from Borrower where Email = @Email;
	if @@ROWCOUNT <> 0 
	begin
		PRINT 'This Email exists'; return;
	end

	insert into Borrower values (@FirstName, @LastName, @Email, @DateOfBirth, CAST(GETDATE() as date));
end

exec InsertNewBorrower 'Sameera', 'Mohammad', 'Samira@gmail.com', '20050101'