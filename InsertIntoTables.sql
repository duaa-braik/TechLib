use TechLib

insert into Book (Title, Author, ISBN, Published, Genre, CurrentStatus) values 
('Pride and Predjudice', 'Jane Austen', '123456', '18130128', 'Romance', 'Borrowed'),
('Sherlock Holmes', 'Arthur Conan Doyle', '147369', '19120125', 'Fiction', 'Available'),
('Clean Code', 'Robert Martin', '258963', '20080801', 'Technology', 'Borrowed')

insert into Borrower (FirstName, LastName, Email, DateOfBirth, MembershipDate) values
('Duaa', 'Braik', 'duaa@gmail.com', '20010311', '20240101'),
('John', 'Smith', 'John@Smith.com', '19900105', '20230125'),
('Robert', 'Martin', 'Robert@gmail.com', '19950402', '20240206')

insert into Loan (BookId, BorrowerId, DateBorrowed, DueDate, DateReturned) values
(7, 1, '20240228', '20240328', '20240325'),
(9, 1, '20240302', '20240402', '20240401'),
(9, 2, '20231205', '20240105', null),
(7, 3, '20240315', '20240415', null)