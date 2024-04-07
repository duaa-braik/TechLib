create function GetBookBorrowingFrequency (@BookTitle varchar(255))
returns int
as 
begin

	Declare @BookFrequency int;
	select @BookFrequency = count(*)
	from Book b
	inner join Loan l
	on b.Id = l.BookId
	where Title = @BookTitle;

	return @BookFrequency;

end;

select dbo.GetBookBorrowingFrequency('Clean Architectue');