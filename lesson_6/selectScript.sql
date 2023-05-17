
-- Какие книги находятся на руках у читателей?

SELECT books.*
FROM library_card_items
LEFT JOIN books
ON library_card_items.book_id = books.id
WHERE library_card_items.return_date IS NULL;

-- End of Какие книги находятся на руках у читателей?


-- Сколько всего книг находится на руках у читателей?

SELECT count(*)
FROM library_card_items
WHERE library_card_items.return_date IS NULL;

-- End of Сколько всего книг находится на руках у читателей?


-- Сколько книг находится на руках у каждого читателя?

SELECT readers.*,
       count(*) AS booksOnHands
FROM library_card_items
LEFT JOIN library_cards
ON library_card_items.library_card_id = library_cards.id
LEFT JOIN readers
ON library_cards.reader_id = readers.id
WHERE library_card_items.return_date IS NULL
GROUP BY readers.id;

-- End of Сколько книг находится на руках у каждого читателя?


-- Сколько раз каждую книгу брали на чтение?

SELECT books.*,
       count(books.id) AS takenForReading
FROM library_card_items
LEFT JOIN books
ON library_card_items.book_id = books.id
GROUP BY books.id;

-- End of Сколько раз каждую книгу брали на чтение?


-- Книги каких авторов читали читатели? (вариант с повторениями)

SELECT books.author
FROM library_card_items
LEFT JOIN books
ON library_card_items.book_id = books.id;

-- End of Книги каких авторов читали читатели? (вариант с повторениями)


-- Книги каких авторов читали читатели? (вариант без повторений)

SELECT DISTINCT(books.author)
FROM library_card_items
LEFT JOIN books
ON library_card_items.book_id = books.id;

-- End of Книги каких авторов читали читатели? (вариант без повторений)


-- Составьте список из названий книг отсортированный в алфавитном порядке (без повторений)

SELECT DISTINCT(books.title)
FROM books
ORDER BY books.title ASC;

-- End of Составьте список из названий книг отсортированный в алфавитном порядке (без повторений)


-- Составьте список из авторов книг в порядке Я -> А (обратном алфавитному)

SELECT DISTINCT(books.author)
FROM books
ORDER BY books.author DESC;

-- End of Составьте список из авторов книг в порядке Я -> А (обратном алфавитному)