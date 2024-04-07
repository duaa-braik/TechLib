select b.Genre,
	case
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) BETWEEN 0 and 12 then '0-12'
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) BETWEEN 13 and 17 then '13-17'
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) BETWEEN 18 and 25 then '18-25'
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) between 26 and 34 then '26-34'
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) between 35 and 40 then '35-40'
		else 'more than 40' end as AgeCategory,
		COUNT(*) as NumberOfBorrowers
from Book b
inner join Loan l
on b.Id = l.BookId
inner join Borrower bo
on bo.Id = l.BorrowerId
group by b.Genre, 
		case
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) BETWEEN 0 and 12 then '0-12'
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) BETWEEN 13 and 17 then '13-17'
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) BETWEEN 18 and 25 then '18-25'
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) between 26 and 34 then '26-34'
		when datediff(year, bo.DateOfBirth, CAST(GETDATE() as date)) between 35 and 40 then '35-40'
		else 'more than 40' end
order by NumberOfBorrowers desc, b.Genre desc, AgeCategory