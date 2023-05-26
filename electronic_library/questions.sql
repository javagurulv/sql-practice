Какие книги в наличии (доступны для заимствования)?
SELECT BookID, Title FROM Books
WHERE BookID NOT IN (SELECT BookID FROM BookTransactions WHERE ReturnDate IS NULL);


Кто автор книги с определенным ID?
SELECT Authors.Name FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID
WHERE Books.BookID = 2;


Какие книги написал определенный автор?
SELECT Title FROM Books
WHERE AuthorID = 1;



Какое количество книг каждого жанра есть в библиотеке?
SELECT Genre, COUNT(*) FROM Books
GROUP BY Genre;


Какие книги взял определенный пользователь?
SELECT Books.Title FROM BookTransactions
JOIN Books ON BookTransactions.BookID = Books.BookID
WHERE UserID = 3;



Какие книги в данный момент на руках у пользователей (не возвращены)?
SELECT Books.Title, Users.Name FROM BookTransactions
JOIN Books ON BookTransactions.BookID = Books.BookID
JOIN Users ON BookTransactions.UserID = Users.UserID
WHERE ReturnDate IS NULL;


Какое количество книг взял каждый пользователь за всё время?
SELECT Users.Name, COUNT(BookTransactions.BookID) FROM Users
JOIN BookTransactions ON Users.UserID = BookTransactions.UserID
GROUP BY Users.UserID;


Какие книги были возвращены после определенной даты?
SELECT Books.Title FROM BookTransactions
JOIN Books ON BookTransactions.BookID = Books.BookID
WHERE ReturnDate > '2023-02-01';


Какие книги были взяты в определенный год?
SELECT Books.Title FROM BookTransactions
JOIN Books ON BookTransactions.BookID = Books.BookID
WHERE YEAR(BorrowDate) = 2023;


Какие книги взяты, но ещё не возвращены?
SELECT Books.Title FROM BookTransactions
JOIN Books ON BookTransactions.BookID = Books.BookID
WHERE ReturnDate IS NULL;


Какова средняя продолжительность чтения книги для каждого пользователя?
SELECT Users.Name, AVG(DATEDIFF(BookTransactions.ReturnDate, BookTransactions.BorrowDate)) as AverageReadingTime
FROM Users
JOIN BookTransactions ON Users.UserID = BookTransactions.UserID
WHERE BookTransactions.ReturnDate IS NOT NULL
GROUP BY Users.UserID;


Какие книги были написаны в определенный год?
SELECT Title FROM Books
WHERE YEAR(PublishDate) = 2005;



Какие книги имеют больше всего страниц?
SELECT Title FROM Books
ORDER BY NumberOfPages DESC
LIMIT 5;


Кто автор с наибольшим количеством книг в библиотеке?
SELECT Authors.Name FROM Authors
JOIN Books ON Authors.AuthorID = Books.AuthorID
GROUP BY Authors.AuthorID
ORDER BY COUNT(Books.BookID) DESC
LIMIT 1;


Какие книги были взяты, но еще не возвращены, и кто их взял?
SELECT Users.Name, Books.Title FROM Users
JOIN BookTransactions ON Users.UserID = BookTransactions.UserID
JOIN Books ON BookTransactions.BookID = Books.BookID
WHERE BookTransactions.ReturnDate IS NULL;


Сколько всего книг в библиотеке?
SELECT COUNT(*) FROM Books;


Сколько всего пользователей в библиотеке?
SELECT COUNT(*) FROM Users;


Какие авторы пишут в определенном жанре?
SELECT Authors.Name FROM Authors
JOIN Books ON Authors.AuthorID = Books.AuthorID
WHERE Books.Genre = 'Фантастика';


Какая книга у данного пользователя на руках в данный момент?
SELECT Books.Title FROM BookTransactions
JOIN Books ON BookTransactions.BookID = Books.BookID
WHERE BookTransactions.UserID = 2 AND BookTransactions.ReturnDate IS NULL;


Сколько книг было взято каждым пользователем за последний месяц?
SELECT Users.Name, COUNT(BookTransactions.BookID) FROM Users
JOIN BookTransactions ON Users.UserID = BookTransactions.UserID
WHERE BookTransactions.BorrowDate > DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH)
GROUP BY Users.UserID;


Какой пользователь взял больше всего книг?
SELECT Users.Name, COUNT(BookTransactions.BookID) as BooksTaken
FROM Users
JOIN BookTransactions ON Users.UserID = BookTransactions.UserID
GROUP BY Users.UserID
ORDER BY BooksTaken DESC
LIMIT 1;


Какие книги возвращались позже всего?
SELECT Books.Title
FROM BookTransactions
JOIN Books ON BookTransactions.BookID = Books.BookID
WHERE DATEDIFF(BookTransactions.ReturnDate, BookTransactions.BorrowDate) > (SELECT AVG(DATEDIFF(ReturnDate, BorrowDate)) FROM BookTransactions WHERE ReturnDate IS NOT NULL);


Сколько времени в среднем проходит между тем, как пользователь берет книгу и возвращает её?
SELECT AVG(DATEDIFF(ReturnDate, BorrowDate)) AS AvgDays
FROM BookTransactions
WHERE ReturnDate IS NOT NULL;


Какие книги ещё никогда не брали?
SELECT Title FROM Books
WHERE BookID NOT IN (SELECT DISTINCT BookID FROM BookTransactions);


Какой самый популярный жанр среди пользователей?
SELECT Books.Genre, COUNT(BookTransactions.BookID) as Popularity
FROM BookTransactions
JOIN Books ON BookTransactions.BookID = Books.BookID
GROUP BY Books.Genre
ORDER BY Popularity DESC
LIMIT 1;


Какой автор имеет наибольшее количество заимствований его книг?
SELECT Authors.Name, COUNT(BookTransactions.BookID) AS BorrowedBooksCount
FROM Authors
JOIN Books ON Authors.AuthorID = Books.AuthorID
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
GROUP BY Authors.AuthorID
ORDER BY BorrowedBooksCount DESC
LIMIT 1;


Какая книга была взята последней?
SELECT Books.Title
FROM Books
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
ORDER BY BookTransactions.BorrowDate DESC
LIMIT 1;


Кто является самым активным пользователем за последний год?
SELECT Users.Name, COUNT(BookTransactions.BookID) AS BorrowedBooksCount
FROM Users
JOIN BookTransactions ON Users.UserID = BookTransactions.UserID
WHERE YEAR(BookTransactions.BorrowDate) = YEAR(CURRENT_DATE) - 1
GROUP BY Users.UserID
ORDER BY BorrowedBooksCount DESC
LIMIT 1;


Какая книга находилась в пользовании дольше всего?
SELECT Books.Title, MAX(DATEDIFF(BookTransactions.ReturnDate, BookTransactions.BorrowDate)) AS DaysBorrowed
FROM Books
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
WHERE BookTransactions.ReturnDate IS NOT NULL
GROUP BY Books.BookID
ORDER BY DaysBorrowed DESC
LIMIT 1;


Какой автор имеет наибольшее количество книг, которые ещё не возвращены?
SELECT Authors.Name, COUNT(BookTransactions.BookID) AS NotReturnedBooksCount
FROM Authors
JOIN Books ON Authors.AuthorID = Books.AuthorID
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
WHERE BookTransactions.ReturnDate IS NULL
GROUP BY Authors.AuthorID
ORDER BY NotReturnedBooksCount DESC
LIMIT 1;


Сколько книг было взято в определенный день недели?
Какой самый редко встречающийся жанр в библиотеке?
Какой пользователь взял наибольшее количество книг определенного автора?
Сколько страниц прочитал каждый пользователь в сумме?

Какая книга взята чаще всего?
SELECT Books.Title, COUNT(BookTransactions.BookID) AS TimesBorrowed
FROM Books
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
GROUP BY Books.BookID
ORDER BY TimesBorrowed DESC
LIMIT 1;


Какие книги возвращены раньше срока (срок возврата 30 дней)?
SELECT Books.Title
FROM Books
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
WHERE DATEDIFF(BookTransactions.ReturnDate, BookTransactions.BorrowDate) < 30 AND BookTransactions.ReturnDate IS NOT NULL;



Какой пользователь возвращает книги позже срока чаще всего (срок возврата 30 дней)?
SELECT Users.Name, COUNT(BookTransactions.BookID) AS LateReturns
FROM Users
JOIN BookTransactions ON Users.UserID = BookTransactions.UserID
WHERE DATEDIFF(BookTransactions.ReturnDate, BookTransactions.BorrowDate) > 30 AND BookTransactions.ReturnDate IS NOT NULL
GROUP BY Users.UserID
ORDER BY LateReturns DESC
LIMIT 1;



Какие книги брали только один раз?
SELECT Books.Title
FROM Books
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
GROUP BY Books.BookID
HAVING COUNT(BookTransactions.BookID) = 1;


Какое общее количество книг было взято за определенный период времени?
SELECT COUNT(*) AS TotalBooks
FROM BookTransactions
WHERE BorrowDate >= '2022-01-01' AND BorrowDate <= '2022-12-31';



Какой день недели является самым популярным для взятия книг?
SELECT DAYNAME(BorrowDate) AS PopularDay, COUNT(*) AS TotalBorrowed
FROM BookTransactions
GROUP BY DAYNAME(BorrowDate)
ORDER BY TotalBorrowed DESC
LIMIT 1;



Какая книга была взята первой в новом году?
SELECT Books.Title
FROM Books
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
WHERE YEAR(BorrowDate) = YEAR(CURRENT_DATE) AND BorrowDate = (
    SELECT MIN(BorrowDate)
    FROM BookTransactions
    WHERE YEAR(BorrowDate) = YEAR(CURRENT_DATE)
);


Какой автор имеет самую молодую аудиторию (судя по возрасту пользователей, которые брали его книги)?
SELECT Authors.Name
FROM Authors
JOIN Books ON Authors.AuthorID = Books.AuthorID
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
JOIN Users ON BookTransactions.UserID = Users.UserID
GROUP BY Authors.AuthorID
ORDER BY MIN(DATEDIFF(CURRENT_DATE, Users.BirthDate)) ASC
LIMIT 1;



Сколько книг определенного жанра взято в данный момент?
SELECT COUNT(*) AS TotalBooks
FROM Books
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
WHERE Books.Genre = 'Ваш_жанр' AND BookTransactions.ReturnDate IS NULL;


Какие книги взяли все пользователи?
SELECT Books.Title
FROM Books
WHERE BookID IN (
    SELECT BookID
    FROM BookTransactions
    GROUP BY BookID
    HAVING COUNT(DISTINCT UserID) = (SELECT COUNT(*) FROM Users)
);


Какой пользователь взял книги большего количества различных авторов?
SELECT Users.Name, COUNT(DISTINCT Authors.AuthorID) AS UniqueAuthorsCount
FROM Users
JOIN BookTransactions ON Users.UserID = BookTransactions.UserID
JOIN Books ON BookTransactions.BookID = Books.BookID
JOIN Authors ON Books.AuthorID = Authors.AuthorID
GROUP BY Users.UserID
ORDER BY UniqueAuthorsCount DESC
LIMIT 1;


Какова максимальная, минимальная и средняя продолжительность заимствования книг?
SELECT MAX(DATEDIFF(ReturnDate, BorrowDate)) AS MaxDays,
       MIN(DATEDIFF(ReturnDate, BorrowDate)) AS MinDays,
       AVG(DATEDIFF(ReturnDate, BorrowDate)) AS AvgDays
FROM BookTransactions
WHERE ReturnDate IS NOT NULL;


Какой жанр книг имеет наименьшее количество заимствований?
SELECT Books.Genre, COUNT(BookTransactions.BookID) AS BorrowedCount
FROM Books
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
GROUP BY Books.Genre
ORDER BY BorrowedCount
LIMIT 1;


Какая книга была возвращена последней?
SELECT Books.Title
FROM Books
JOIN BookTransactions ON Books.BookID = BookTransactions.BookID
ORDER BY BookTransactions.ReturnDate DESC
LIMIT 1;


Какой пользователь вернул книги позже всего после срока возврата?
SELECT Users.Name, MAX(DATEDIFF(BookTransactions.ReturnDate, BookTransactions.BorrowDate)) AS DaysLate
FROM Users
JOIN BookTransactions ON Users.UserID = BookTransactions.UserID
WHERE BookTransactions.ReturnDate > DATE_ADD(BookTransactions.BorrowDate, INTERVAL 30 DAY)
GROUP BY Users.UserID
ORDER BY DaysLate DESC
LIMIT 1;

