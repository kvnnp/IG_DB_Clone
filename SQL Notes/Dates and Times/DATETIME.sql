## DATE, TIME, DATETIME
# Compare and contrast DATE, TIME and DATETIME
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
		
INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
		
INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('Toaster', '2017-04-21', '19:12:43', '2017-04-21 19:12:43');

SELECT * FROM people;

## CURDATE, CURTIME, NOW
# You can use this to insert data or compare data to the current time
INSERT INTO people(name, birthdate, birthtime, birthdt) VALUES ('Microwave', CURDATE(), CURTIME(), NOW()); 
SELECT * FROM people;





