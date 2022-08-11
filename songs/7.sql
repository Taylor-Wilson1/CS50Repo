-- SELECT

SELECT AVG(energy) FROM songs WHERE artist_id = (SELECT id FROM artists WHERE name = "Drake");
-- SELECT COUNT(name) FROM songs WHERE = (SELECT name FROM songs WHERE artist_id = (SELECT id FROM artists WHERE name = "Drake"));
-- SELECT name FROM songs WHERE artist_id = (SELECT id FROM artists WHERE name = "Drake");

-- Count Songs to get average?