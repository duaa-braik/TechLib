select b.Title, l.DateReturned
from Book b
inner join Loan l
on b.Id = l.BookId
inner join Borrower bo
on bo.Id = l.BorrowerId
where bo.FirstName = 'Duaa' and bo.LastName = 'Braik';