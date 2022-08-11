-- In 4.sql, write a SQL query to determine the number of movies with an IMDb rating of 10.0.
-- Your query should output a table with a single column and a single row (not including the header) containing the number of movies with a 10.0 rating.
-- SELECT COUNT(title) as Counter FROM movies WHERE id = (SELECT movie_id FROM ratings WHERE rating = 10.0);
SELECT COUNT(title) as Counter FROM movies JOIN ratings ON movies.id = ratings.movie_id WHERE rating = 10;

-- id = (SELECT movie_id FROM ratings WHERE )
--  WHERE rating = 10.0);
-- (SELECT rating FROM ratings WHERE rating = 2010);