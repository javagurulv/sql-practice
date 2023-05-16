
-- SQL script for schema creation

CREATE SCHEMA IF NOT EXISTS sql_practice_lesson_5
DEFAULT CHARACTER SET utf8 ;
USE sql_practice_lesson_5;

-- End of SQL script for schema creation

commit;


-- SQL script for "readers" table creation

CREATE TABLE readers (
    id BIGINT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    personal_code VARCHAR(12) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY(id)
);

-- End of SQL script for "readers" table creation

-- SQL script for "books" table creation

CREATE TABLE books (
    id BIGINT AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(200) NOT NULL,
    year_of_issue INT NOT NULL,
    page_count INT,
    PRIMARY KEY(id)
);

-- End of SQL script for "books" table creation

-- SQL script for "library_cards" table creation

CREATE TABLE library_cards (
    id BIGINT AUTO_INCREMENT,
    reader_id BIGINT NOT NULL,
    unique_code VARCHAR(100) NOT NULL,
    date_of_issue DATE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(reader_id) REFERENCES readers(id)
);

-- End of SQL script for "library_cards" table creation


-- SQL script for "library_card_items" table creation

CREATE TABLE library_card_items (
    id BIGINT AUTO_INCREMENT,
    library_card_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    issue_date DATE NOT NULL,
    return_date DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(library_card_id) REFERENCES library_cards(id),
    FOREIGN KEY(book_id) REFERENCES books(id)
);

-- End of SQL script for "library_card_items" table creation


-- SQL script for indexes creation

CREATE INDEX index_books_title
ON books(title);

CREATE INDEX index_books_author
ON books(author);

CREATE INDEX index_readers_first_name
ON readers(first_name);

CREATE INDEX index_readers_last_name
ON readers(last_name);

CREATE INDEX index_readers_personal_code
ON readers(personal_code);

CREATE INDEX index_readers_phone
ON readers(phone);

-- End of SQL script for indexes creation


-- SQL script to create unique indexes

CREATE UNIQUE INDEX index_books_title_author
ON books(title, author);

CREATE UNIQUE INDEX index_library_cards_unique_code
ON library_cards(unique_code);

-- End of SQL script to create unique indexes