# Evaluate the following
SELECT 10 != 10;
SELECT 15 > 14 && 99-5 <= 94;
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;

# Select all books written before 1980 (non-inclusive)
SELECT * FROM books WHERE released_year < 1980;

# Select all books written by Eggers or Chabon
SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');

# Select all books written by Lahiri, published after 2000
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

# Select all books with page counts between 100 and 200
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

# Select all books where author_lname starts with a 'C' or an 'S'
SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT * FROM books WHERE SUBSTR(author_lname,1,1) IN ('C', 'S'); # start at position 1, strip 1 character


# IF title contains 'stories' -> short stories, just kids and a heartbreaking work -> memoir, everything else -> novel
SELECT title, author_lname, 
		CASE
			WHEN title LIKE '%Stories%' THEN 'Short Stories'
			WHEN title LIKE '%Just Kids%' OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
			ELSE 'Novel'
		END AS 'TYPE'
FROM books; 


# BONUS: Query title, author_lname and count of books by author. Count should be pluralized if author has more than one book, otherwise not.
SELECT title, author_lname, 
	CONCAT(COUNT(*), 
		CASE
			WHEN COUNT(*) > 1 THEN ' books'
		   	ELSE ' book' END
	) AS COUNT
FROM books GROUP BY author_lname;


SELECT title, author_lname, 
	CASE
		WHEN COUNT(*) = 1 THEN '1 book'
		ELSE CONCAT(COUNT(*), ' books')
	END AS COUNT
FROM books GROUP BY author_lname;


