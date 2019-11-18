-- 1. We want to reward users who have been around the longest. Find the 5 oldest users.
SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- 2. We need to figure out when to schedule an ad campaign. What day of the week do most users register on?
SELECT 
	DATE_FORMAT(created_at, '%W') AS days, 
	COUNT(*) AS 'COUNT' 
FROM users
GROUP BY days
ORDER BY COUNT DESC
LIMIT 2;

-- 3. We want to target our inactive users with an email campaign. Find the users who have never posted a photo.
SELECT username FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- 4. Identify most popular photo (and user who created it).
SELECT
	username,
	photos.id,
	photos.image_url,
	COUNT(*) AS 'COUNT' 
FROM photos
INNER JOIN likes ON photos.id = likes.photo_id
INNER JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY COUNT desc
LIMIT 1;

-- 5. Calculate avg number of photos per user.
SELECT 
	(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;
	
-- 6. What are the top 5 most commonly used hashtags? 
SELECT 
	tag_name, 
	COUNT(*) AS COUNT 
FROM tags 
INNER JOIN photo_tags 
	ON tags.id = photo_tags.tag_id 
GROUP BY tag_name 
ORDER BY COUNT DESC 
LIMIT 5;

-- 7. Bot detection - Find users who have liked every single photo on the site. 
SELECT 
	username,
	COUNT(likes.photo_id) AS num_likes
FROM users
INNER JOIN likes
	ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos); 

# HAVING is the equivalent of WHERE, but for aggregate functions; it only works after GROUP BY








