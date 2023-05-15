
CREATE SCHEMA IF NOT EXISTS sql_practice_lesson_3
DEFAULT CHARACTER SET utf8 ;
USE sql_practice_lesson_3;

commit;


-- SQL script for "readers" table creation
CREATE TABLE readers (
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    personal_code VARCHAR(12),
    email VARCHAR(100),
    phone VARCHAR(20),
    date_of_birth DATE
);
-- End of SQL script for "readers" table creation

commit;

-- SQL script for "books" table creation
CREATE TABLE books (
    title VARCHAR(1000),
    author VARCHAR(200),
    year_of_issue INT,
    page_count INT
);
-- End of SQL script for "books" table creation

commit;