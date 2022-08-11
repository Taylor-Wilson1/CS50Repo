-- In 11.sql, write a SQL query to list the titles of the five highest rated movies (in order) that Chadwick Boseman starred in, starting with the highest rated.
-- Your query should output a table with a single column for the title of each movie.
-- You may assume that there is only one person in the database with the name Chadwick Boseman.

-- SELECT title FROM movies WHERE id IN (SELECT movie_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = "Chadwick Boseman")) LIMIT 5;
-- SELECT name FROM people JOIN stars ON people.id = stars.person_id WHERE movie_id = (SELECT id FROM movies WHERE title = "Toy Story");
SELECT title FROM movies JOIN ratings ON movies.id = ratings.movie_id WHERE id IN (SELECT movie_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = "Chadwick Boseman")) ORDER BY rating DESC LIMIT 5;

-- SELECT name FROM people WHERE name LIKE = "%Chadwick Boseman%";

-- ORDER BY rating LIMIT 5;