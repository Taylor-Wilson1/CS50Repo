-- In 8.sql, write a SQL query to list the names of all people who starred in Toy Story.
-- Your query should output a table with a single column for the name of each person.
-- You may assume that there is only one movie in the database with the title Toy Story.

-- = (SELECT title FROM movies WHERE title = "Toy Story");

-- SELECT title FROM movies WHERE title = "Toy Story";
-- SELECT person_id FROM stars WHERE movie_id = 114709;
-- SELECT name FROM people WHERE id = 158, 741, 725543, 1815;

-- SELECT name FROM people WHERE id IN (SELECT person_id FROM stars WHERE movie_id = (SELECT id FROM movies WHERE title = "Toy Story"));
SELECT name FROM people JOIN stars ON people.id = stars.person_id WHERE movie_id = (SELECT id FROM movies WHERE title = "Toy Story");
-- SELECT title, rating FROM movies JOIN ratings ON movies.id = ratings.movie_id WHERE year = 2010 ORDER BY rating DESC, title;