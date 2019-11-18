-- Challenge 1
SELECT 
	title, 
	rating 
FROM series
LEFT JOIN reviews 
	ON series.id = reviews.series_id
LIMIT 15;

-- Challenge 2
SELECT title, AVG(rating) AS avg_rating
FROM series 
LEFT JOIN reviews
	ON series.id = reviews.series_id
WHERE rating IS NOT NULL
GROUP BY series.id # series.id is unique, but titles might not be
ORDER BY avg_rating;

-- Challenge 3
SELECT first_name, last_name, rating
FROM reviewers
INNER JOIN reviews ON reviewers.id = reviews.reviewer_id; # when it's an inner join, the order doesn't matter
# We use inner join because we only want existing reviews (47 reviews), not including NULL reviews (48 reviews)

-- Challenge 4
SELECT title AS unreviewed_series FROM series 
LEFT JOIN reviews ON series.id = reviews.series_id
WHERE rating IS NULL;

-- Challenge 5
SELECT genre, ROUND(AVG(rating),2) AS avg_rating FROM series
INNER JOIN reviews ON series.id = reviews.series_id # we use INNER JOIN because we don't want nonexistant ratings 
GROUP BY genre;

-- Challenge 6
SELECT 
	first_name, 
	last_name, 
	COUNT(reviews.reviewer_id) AS 'COUNT',
	ROUND(IFNULL(MIN(rating), 0), 2) AS 'MIN',
	ROUND(IFNULL(MAX(rating), 0), 2) AS 'MAX',
	ROUND(IFNULL(AVG(rating), 0), 2) AS 'AVG',
	CASE
		WHEN COUNT(reviews.reviewer_id) >= 10 THEN 'POWER USER'
		WHEN COUNT(reviews.reviewer_id) > 0 THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END AS 'STATUS'
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY reviews.reviewer_id;

SELECT 
	first_name, 
	last_name, 
	COUNT(reviews.reviewer_id) AS 'COUNT',
	ROUND(IFNULL(MIN(rating), 0), 2) AS 'MIN',
	ROUND(IFNULL(MAX(rating), 0), 2) AS 'MAX',
	ROUND(IFNULL(AVG(rating), 0), 2) AS 'AVG',
	IF(COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS 'STATUS'
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY reviews.reviewer_id;

-- Challenge 7
SELECT title, rating, CONCAT(first_name, ' ', last_name) AS reviewer FROM series
INNER JOIN reviews ON series.id = reviews.series_id
INNER JOIN reviewers ON reviews.reviewer_id = reviewers.id;



