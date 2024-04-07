with NonReturnedBooks (FirstName, LastName, BookId)
as (
	select b.FirstName, b.LastName, l.BookId
	from Borrower b
	inner join Loan l
	on b.Id = l.BorrowerId
	where l.DateReturned is null
)

select FirstName, LastName
from NonReturnedBooks
group by FirstName, LastName
having count(BookId) >= 2