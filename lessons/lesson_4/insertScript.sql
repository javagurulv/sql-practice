-- SQL script to insert data to "books" table
INSERT INTO books(title, author, year_of_issue, page_count)
VALUES("Три мушкетёра", "Александр Дюма", 1844, 600);

INSERT INTO books(title, author, year_of_issue, page_count)
VALUES("Не верьте цифрам!", "Джон Богл", 2021, 530);
-- End of SQL script to insert data to "books" table



-- SQL script to insert data to "readers" table
INSERT INTO readers(first_name,
                    last_name,
                    personal_code,
                    email,
                    phone,
                    date_of_birth)
VALUES("Vasja",
       "Pupkin",
       "111111-00000",
       "vasja@inbox.lv",
       "+37126130970",
       "2010.01.22");

INSERT INTO readers(first_name,
                    last_name,
                    personal_code,
                    email,
                    phone,
                    date_of_birth)
VALUES("Ekaterina",
       "Karpina",
       "222222-99999",
       "e.karpina@inbox.lv",
       "+37126770999",
       "2000.10.22");

-- End of SQL script to insert data to "readers" table


-- SQL script to insert data to "library_cards" table
INSERT INTO library_cards(
	reader_id,
    unique_code,
    date_of_issue)
VALUES (
	1,
    "LIB_CARD_1",
    "2023.01.22"
);


INSERT INTO library_cards(
	reader_id,
    unique_code,
    date_of_issue)
VALUES (
	2,
    "LIB_CARD_2",
    "2023.03.14"
);
-- End of SQL script to insert data to "library_cards" table

-- SQL script to insert data to "library_card_items" table
INSERT INTO library_card_items(
	library_card_id,
    book_id,
    issue_date,
    return_date
)
VALUES (
	1,
    1,
    "2023.03.14",
    "2023.03.20"
);

INSERT INTO library_card_items(
	library_card_id,
    book_id,
    issue_date,
    return_date
)
VALUES (
	1,
    2,
    "2023.04.15",
    "2023.04.25"
);
-- End of SQL script to insert data to "library_card_items" table