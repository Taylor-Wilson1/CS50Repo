-- In 3.sql, write a SQL query to list the names of the top 5 LONGEST SONGS,
-- in descending order of length.
SELECT name FROM songs ORDER BY duration_ms DESC LIMIT 5;