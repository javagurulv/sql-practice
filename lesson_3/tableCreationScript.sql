
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

-- SQL script for "books" table creation
CREATE TABLE books (
    title VARCHAR(1000),
    author VARCHAR(200),
    year_of_issue INT,
    page_count INT
);
--End of SQL script for "books" table creation
