# DATETIME and TIMESTAMP have DIFFERENT ranges. So why would you use TIMESTAMP?
# TIMESTAMP takes up less space (4 bytes vs 8 bytes)

CREATE TABLE comments (
	content VARCHAR(100),
	created_at TIMESTAMP DEFAULT NOW() # TIMESTAMP could be DATETIME, but TIMESTAMP is better
);

INSERT INTO comments (content) VALUES('lol what a funny comment');

INSERT INTO comments (content) VALUES('I found this offensive');

INSERT INTO comments (content) VALUES('gibberish');

SELECT * FROM COMMENTS ORDER BY created_at;