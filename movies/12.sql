-- In 12.sql, write a SQL query to list the titles of all movies in which both Johnny Depp and Helena Bonham Carter starred.
-- Your query should output a table with a single column for the title of each movie.
-- You may assume that there is only one person in the database with the name Johnny Depp.
-- You may assume that there is only one person in the database with the name Helena Bonham Carter.

--  SELECT title FROM movies JOIN ratings ON movies.id = ratings.movie_id WHERE id IN (SELECT movie_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = "Chadwick Boseman")) ORDER BY rating DESC LIMIT 5;
-- SELECT title FROM movies WHERE id IN (SELECT movie_id FROM stars WHERE person_id IN (SELECT id FROM people WHERE name = "Johnny Depp") AND (SELECT id FROM people WHERE name = "Helena Bonham Carter"));
-- SELECT title FROM movies WHERE id IN (SELECT movie_id FROM stars WHERE person_id IN (SELECT id FROM people WHERE name = "Johnny Depp" UNION name = "Helena Bonham Carter")) ORDER BY title;

SELECT title FROM movies WHERE id IN (SELECT movie_id FROM stars WHERE person_id IN (SELECT id FROM people WHERE name = "Johnny Depp")) UNION SELECT title FROM movies WHERE id IN (SELECT movie_id FROM stars WHERE person_id IN (SELECT id FROM people WHERE name = "Helena Bonham Carter")) ORDER BY title;
Check if both have the same movie

SELECT title FROM movies JOIN stars ON movies.id = stars.movie_id WHERE person_id IN (SELECT id FROM people WHERE name = "Johnny Depp") AND person_id = (SELECT id FROM people WHERE name = "Helena Bonham Carter");

-- SELECT name FROM songs WHERE artist_id = (SELECT id FROM artists WHERE name = "Post Malone");


