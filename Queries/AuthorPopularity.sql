select b.Author, RANK() over (order by count(l.BorrowerId) desc) as rank
from Book b
inner join Loan l
on b.Id = l.BookId
group by b.Author