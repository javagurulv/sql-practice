
-- SQL script for "readers" table creation
CREATE TABLE readers (
    id BIGINT AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    personal_code VARCHAR(12),
    email VARCHAR(100),
    phone VARCHAR(20),
    date_of_birth DATE,
    PRIMARY KEY(id)
);
-- End of SQL script for "readers" table creation

-- SQL script for "books" table creation
CREATE TABLE books (
    id BIGINT AUTO_INCREMENT,
    title VARCHAR(1000),
    author VARCHAR(200),
    year_of_issue INT,
    page_count INT,
    PRIMARY KEY(id)
);
--End of SQL script for "books" table creation

-- SQL script for "library_cards" table creation
CREATE TABLE library_cards (
    id BIGINT AUTO_INCREMENT,
    reader_id BIGINT,
    unique_code VARCHAR(100),
    date_of_issue DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(reader_id) REFERENCES readers(id)
);
--End of SQL script for "library_cards" table creation


-- SQL script for "library_card_items" table creation
CREATE TABLE library_card_items (
    id BIGINT AUTO_INCREMENT,
    library_card_id BIGINT,
    book_id BIGINT,
    issue_date DATE,
    return_date DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(library_card_id) REFERENCES library_cards(id),
    FOREIGN KEY(book_id) REFERENCES books(id)
);
--End of SQL script for "library_card_items" table creation
