select b.FirstName, b.LastName, count(*) as numberOfBorrowedBooks,
RANK() over (order by count(BookId) desc) as rank -- Dense_Rank() can be also used
from Loan l
inner join Borrower b
on l.BorrowerId = b.Id
group by b.FirstName, b.LastName