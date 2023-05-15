-- SQL script to select data from tables

SELECT title, author FROM books;

SELECT * FROM books;

SELECT first_name, last_name FROM readers;

SELECT email FROM readers;

SELECT phone, date_of_birth FROM readers;

SELECT title, author
FROM books
WHERE year_of_issue > 1900;


SELECT title, author
FROM books
WHERE page_count > 100 AND page_count < 900;


SELECT title, author
FROM books
WHERE page_count > 900 AND year_of_issue > 1900;


SELECT first_name, last_name
FROM readers
WHERE email = "vasja@inbox.lv";


SELECT *
FROM readers
WHERE first_name = "Vasja" AND last_name = "Pupkin";


SELECT *
FROM readers
WHERE (first_name = "Vasja" AND last_name = "Pupkin")
        OR first_name = "Джеймс";

-- End of SQL script to select data from tables
