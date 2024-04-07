-- BOUNUS --
	--Weekly peak days: The library is planning to employ a new part-time worker. This worker will work 3 days weekly in the library.
	--From the data you have, determine the most 3 days in the week that have the most share of the loans and display the result of each
	--day as a percentage of all loans. Sort the results from the highest percentage to the lowest percentage.
	--(eg. 25.18% of the loans happen on Monday...)
use TechLib
with PeakDays as
(
	select top(3) DATENAME(WEEKDAY, l.DateBorrowed) as DayOfTheWeek,
		count(DATENAME(WEEKDAY, l.DateBorrowed)) / 7.0 * 100 as LoanPercentagePerDay
	from Loan l
	group by DATENAME(WEEKDAY, l.DateBorrowed)
	order by LoanPercentagePerDay desc
) 

select DayOfTheWeek
from PeakDays
