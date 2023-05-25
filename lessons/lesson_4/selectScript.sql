
-- Какие книги читал читатель с читательским билетом "LIB_CARD_1"?

SELECT b.*
FROM library_cards as lc
LEFT JOIN library_card_items as lci
ON lc.id = lci.library_card_id
LEFT JOIN books as b
ON lci.book_id = b.id
WHERE lc.unique_code = "LIB_CARD_1";


SELECT books.*
FROM library_cards
LEFT JOIN library_card_items
ON library_cards.id = library_card_items.library_card_id
LEFT JOIN books
ON library_card_items.book_id = books.id
WHERE library_cards.unique_code = "LIB_CARD_1";

-- End of Какие книги читал читатель с читательским билетом "LIB_CARD_1"?

-- Какие книги читали читатели?

SELECT b.*
FROM books AS b
INNER JOIN library_card_items AS lci
ON b.id = lci.book_id;

-- End of Какие книги читали читатели?


-- Какие книги не читали читатели?

SELECT b.*
FROM books AS b
LEFT JOIN library_card_items AS lci
ON b.id = lci.book_id
WHERE lci.book_id IS NULL;

-- End of Какие книги не читали читатели?
