select b.Title, bo.FirstName, bo.LastName
from  Borrower bo
inner join Loan l
on bo.Id = l.BorrowerId
inner join Book b
on b.Id = l.BookId
where DATEDIFF(day, l.DueDate, CAST(GETDATE() as date)) > 30 and l.DateReturned is null;