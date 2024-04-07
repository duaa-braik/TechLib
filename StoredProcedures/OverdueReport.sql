create table #BorrowerWithOverdueBooks
(
	Id int,
	FirstName varchar(100),
	LastName varchar(100),
	Email varchar(100),
	DateOfBirth date,
	MembershipDate date
);

create procedure FillBorrowersData 
as begin
	insert into #BorrowerWithOverdueBooks 
	select distinct bo.Id, bo.FirstName, bo.LastName, bo.Email, bo.DateOfBirth, bo.MembershipDate
	from Borrower bo 
	inner join Loan l
	on bo.Id = l.BorrowerId
	where l.DateReturned is null and DATEDIFF(day, l.DueDate, CAST(GETDATE() as date)) > 0
end

exec FillBorrowersData

select CONCAT(bo.FirstName, ' ', bo.LastName) as Borrower,
		count(*) as NumberOfNonReturnedBooks,
		sum(dbo.CalculateFees(l.Id)) as OverdueFees
from #BorrowerWithOverdueBooks bo
inner join Loan l on bo.Id = l.BorrowerId
inner join Book b on b.Id = l.BookId
group by CONCAT(bo.FirstName, ' ', bo.LastName)
