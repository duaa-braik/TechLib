use TechLib

create table Book
(
	Id int identity(1, 1) primary key,
	Title varchar(255),
	Author varchar(50),
	ISBN varchar(17),
	Published Date,
	Genre varchar(50),
	ShelfLocation varchar(50),
	CurrentStatus varchar(20) NOT NULL check (CurrentStatus in ('Available', 'Borrowed'))
);

create table Borrower
(
	Id int identity(1, 1) primary key,
	FirstName varchar(100),
	LastName varchar(100),
	Email varchar(100),
	DateOfBirth Date Null,
	MembershipDate Date Not Null
);

create table Loan
(
	Id int identity(1, 1) primary key,
	BookId int,
	BorrowerId int,
	DateBorrowed Date,
	DueDate Date,
	DateReturned Date,
	foreign key (BookId) references Book(Id),
	foreign key (BorrowerId) references Borrower(Id)
);