use TechLib
GO

declare @Month int;

set @Month = 3;

select b.Genre, Rank() over (order by count(*) desc) as Popularity
from Book b
inner join Loan l
on b.Id = l.BookId
where Month(l.DateBorrowed) = @Month
group by b.Genre