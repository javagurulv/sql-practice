-- SQL script to update data in table

UPDATE books
SET year_of_issue = 1999
WHERE title = "Три мушкетёра";

UPDATE books
SET page_count = 99;


UPDATE books
SET title = "Три мушкета"
WHERE title = "Три мушкетёра";

-- End of SQL script to update data in table
