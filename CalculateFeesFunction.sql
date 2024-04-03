create Function CalculateFees(@LoanId int)
returns int
as
begin

	Declare @FeesPerDay int = 2;
	Declare @DueDate date;
	Declare @DateReturned date;

	Declare @Days int;

	select @DueDate = DueDate, @DateReturned = DateReturned from Loan where Id = @LoanId;

	if(@DateReturned is not null) return 0;

	set @Days = DATEDIFF(day, @DueDate, CAST(GETDATE() as date));

	if(@Days <= 0) return 0;

	return @Days * @FeesPerDay;
end;

select dbo.CalculateFees(1);