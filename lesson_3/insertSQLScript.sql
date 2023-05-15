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
