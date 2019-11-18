# DAY, DAYNAME, DAYOFWEEK, DAYOFYEAR
SELECT name, birthtime, DAYOFYEAR(birthdate) FROM people;


# DATE_FORMAT(date, format)  (Check documention on dev.mysql.com for specifiers)
# It's better to remember DATE_FORMAT() than to remember 15 separate functions for every component of DATETIME
SELECT name, DATE_FORMAT(birthdt, 'Was born on a %W ') FROM people;

# Returning birthdt's date and hours:minutes
SELECT name, DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;