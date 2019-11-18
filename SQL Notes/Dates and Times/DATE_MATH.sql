## DATE ARITHMETIC

# DATEDIFF, DATE_ADD, +/-
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people; # adding 3 quarters of a year

SELECT birthdt, birthdt + INTERVAL 1 MONTH from people;

SELECT birthdt, birthdt - INTERVAL 5 MONTH from people;

SELECT birthdt, birthdt + INTERVAL 15 MONTH  + INTERVAL 10 HOUR from people;
