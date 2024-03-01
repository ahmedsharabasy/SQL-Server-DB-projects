



SELECT book.book_id, book.title, book.language_id, book.isbn13, book.num_pages, 
       book.publication_date, book.publisher_id, book_language.language_code, 
       book_language.language_name, publisher.publisher_name, 
	   book_author.author_id, author.author_name
FROM     book LEFT OUTER JOIN
		book_author ON book.book_id = book_author.book_id LEFT OUTER JOIN
		author ON book_author.author_id = author.author_id LEFT OUTER JOIN
		book_language ON book.language_id = book_language.language_id LEFT OUTER JOIN
		publisher ON book.publisher_id = publisher.publisher_id;