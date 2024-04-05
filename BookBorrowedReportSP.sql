create procedure BorrowedBooksReport (@StartDate date, @EndDate date)
as begin

	select b.ISBN, b.Title, b.Author, b.Genre, CONCAT(bo.FirstName, ' ', bo.LastName)
	from Book b
	inner join Loan l on b.Id = l.BookId
	inner join Borrower bo on l.BorrowerId = bo.Id
	where l.DateBorrowed between @StartDate and @EndDate

end

exec dbo.BorrowedBooksReport '20240201', '20240304'