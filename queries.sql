-- Queries.sql for final project of TV Series Database
-- Contents:
    -- Ln 6 - Inserting sample data for each table in database
    -- Ln 119 - Testing Queries including SELECT, INSERT, DELETE and UPDATE
    
-- *INSERTING SAMPLE DATA*

-- Inserting sample data for Table: Series
 INSERT INTO series (id, title, release_year, studio_id, creator) VALUES
    (1001, 'Breaking Bad', 2008, 31, 'Vince Gilligan'),
    (1002, 'Game of Thrones', 2011, 32, 'David J. Benioff'),
    (1003, 'Sherlock', 2010, 33, 'Steven Moffat'),
    (1004, 'Peaky Blinders', 2013, 34, 'Steven Knight'),
    (1005, 'Hannibal', 2013, 37, 'Bryan Fuller'),
    (1006, 'Daredevil', 2015, 35, 'Drew Goddard'),
    (1007, 'The Boys', 2019, 31, 'Eric Kripke'),
    (1008, 'House of The Dragon', 2022, 32, 'Ryan Condal'),
    (1009, 'Stranger Things', 2016, 34, 'Duffer Brothers'),
    (1010, 'The Mandalorian', 2019, 35, 'Jon Favreau');

-- Inserting sample data for Table: Studios
INSERT INTO studios (id, studio_name) VALUES 
    (31, 'AMC+'),
    (32, 'HBO'),
    (33, 'BBC'),
    (34, 'Netflix'),
    (35, 'Disney+'),
    (36, 'Amazon Prime'),
    (37, 'FX');

-- Inserting sample data for Table: Genres
INSERT INTO Genres (id, genre_name) VALUES
    (51, 'Drama'),
    (52, 'Fantasy'),
    (53, 'Action'),
    (54, 'Thriller');

-- Inserting sample data for Table: Series_genre
INSERT INTO Series_Genre (id, series_id, genre_id) VALUES
    (71, (SELECT id FROM series WHERE title = 'Breaking Bad'), (SELECT id FROM genres WHERE genre_name = 'Drama')),
    (72, (SELECT id FROM series WHERE title = 'Game of Thrones'), (SELECT id FROM genres WHERE genre_name = 'Fantasy')),
    (73, (SELECT id FROM series WHERE title = 'Sherlock'), (SELECT id FROM genres WHERE genre_name = 'Thriller')),
    (74, (SELECT id FROM series WHERE title = 'Peaky Blinders'), (SELECT id FROM genres WHERE genre_name = 'Drama')),
    (75, (SELECT id FROM series WHERE title = 'Hannibal'), (SELECT id FROM genres WHERE genre_name = 'Thriller')),
    (76, (SELECT id FROM series WHERE title = 'Daredevil'), (SELECT id FROM genres WHERE genre_name = 'Action')),
    (77, (SELECT id FROM series WHERE title = 'The Boys'), (SELECT id FROM genres WHERE genre_name = 'Action')),
    (78, (SELECT id FROM series WHERE title = 'House of The Dragon'), (SELECT id FROM genres WHERE genre_name = 'Fantasy')),
    (79, (SELECT id FROM series WHERE title = 'Stranger Things'), (SELECT id FROM genres WHERE genre_name = 'Thriller')),
    (80, (SELECT id FROM series WHERE title = 'The Mandalorian'), (SELECT id FROM genres WHERE genre_name = 'Fantasy'));

-- Inserting sample data for Table: Ranking
INSERT INTO Ranking (series_title, earned_rating, rank) VALUES
    ((SELECT title FROM series WHERE id = 1001), 9.2, '1st'),
    ((SELECT title FROM series WHERE id = 1002), 9.0, '2nd'),
    ((SELECT title FROM series WHERE id = 1003), 8.9, '3rd'),
    ((SELECT title FROM series WHERE id = 1004), 8.6, '4th'),
    ((SELECT title FROM series WHERE id = 1005), 8.5, '5th'),
    ((SELECT title FROM series WHERE id = 1006), 8.4, '7th'),
    ((SELECT title FROM series WHERE id = 1007), 8.5, '6th'),
    ((SELECT title FROM series WHERE id = 1008), 8.4, '8th'),
    ((SELECT title FROM series WHERE id = 1009), 8.3, '9th'),
    ((SELECT title FROM series WHERE id = 1010), 8.2, '10th');

-- Inserting sample data for Table: Episodes
INSERT INTO episodes (id, series_id, episode_title, imdb_rating) VALUES
    (701, (SELECT id FROM series WHERE title = 'Breaking Bad'), 'Ozymandias', 10.0),
    (702, (SELECT id FROM series WHERE title = 'Breaking Bad'), 'Felina', 9.9),
    (703, (SELECT id FROM series WHERE title = 'Breaking Bad'), 'Face Off', 9.8),
    (704, (SELECT id FROM series WHERE title = 'Game of Thrones'), 'The Battle of Bastards', 9.9),
    (705, (SELECT id FROM series WHERE title = 'Game of Thrones'), 'The Rains of Castamere', 9.9),
    (706, (SELECT id FROM series WHERE title = 'Game of Thrones'), 'Hardhome', 9.8),
    (707, (SELECT id FROM series WHERE title = 'Sherlock'), 'The Reichenbach Fall', 9.6),
    (708, (SELECT id FROM series WHERE title = 'Peaky Blinders'), '#2.6', 9.5),
    (709, (SELECT id FROM series WHERE title = 'Hannibal'), 'Mizumono', 9.8),
    (710, (SELECT id FROM series WHERE title = 'Daredevil'), 'Blindsided', 9.5),
    (711, (SELECT id FROM series WHERE title = 'The Boys'), 'Herogasm', 9.4),
    (712, (SELECT id FROM series WHERE title = 'House of The Dragon'), 'The Black Queen', 9.2),
    (713, (SELECT id FROM series WHERE title = 'House of The Dragon'), 'The Lord of Tides', 9.3),
    (714, (SELECT id FROM series WHERE title = 'Stranger Things'), 'The Massacre of Hawkins`Lab', 9.6),
    (715, (SELECT id FROM series WHERE title = 'The Mandalorian'), 'The Rescue', 9.8);

-- Inserting sample data for Table: Characters
INSERT INTO Characters (id, character_name, series_id) VALUES
    (251, 'Walter White', (SELECT id FROM series WHERE title = 'Breaking Bad')),
    (252, 'Jesse Pinkman', (SELECT id FROM series WHERE title = 'Breaking Bad')),
    (253, 'Saul Goodman', (SELECT id FROM series WHERE title = 'Breaking Bad')),
    (254, 'Jon Snow', (SELECT id FROM series WHERE title = 'Game of Thrones')),
    (255, 'Tyrion Lannister', (SELECT id FROM series WHERE title = 'Game of Thrones')),
    (256, 'Sherlock Holmes', (SELECT id FROM series WHERE title = 'Sherlock')),
    (257, 'Thomas Shelby', (SELECT id FROM series WHERE title = 'Peaky Blinders')),
    (258, 'Alfie Solomons', (SELECT id FROM series WHERE title = 'Peaky Blinders')),
    (259, 'Hannibal Lecter', (SELECT id FROM series WHERE title = 'Hannibal')),
    (260, 'Will Graham', (SELECT id FROM series WHERE title = 'Hannibal')),
    (261, 'Matt Murdock', (SELECT id FROM series WHERE title = 'Daredevil')),
    (262, 'Billy Butcher', (SELECT id FROM series WHERE title = 'The Boys')),
    (263, 'Daemon Targaryen', (SELECT id FROM series WHERE title = 'House of The Dragon')),
    (264, 'Jim Hopper', (SELECT id FROM series WHERE title = 'Stranger Things')),
    (265, 'Din Djarin', (SELECT id FROM series WHERE title = 'The Mandalorian'));

-- Inserting sample data for Table: Actors
INSERT INTO Actors (id, actor_name, character_id) VALUES 
    (451, 'Bryan Cranston', (SELECT id FROM characters WHERE character_name = 'Walter White')),
    (452, 'Aaron Paul', (SELECT id FROM characters WHERE character_name = 'Jesse Pinkman')),
    (453, 'Ben Odenkirk', (SELECT id FROM characters WHERE character_name = 'Saul Goodman')),
    (454, 'Kit Harington', (SELECT id FROM characters WHERE character_name = 'Jon Snow')),
    (455, 'Peter Dinklage', (SELECT id FROM characters WHERE character_name = 'Tyrion Lannister')),
    (456, 'Benedict Cumberbatch', (SELECT id FROM characters WHERE character_name = 'Sherlock Holmes')),
    (457, 'Cillian Murphy', (SELECT id FROM characters WHERE character_name = 'Thomas Shelby')),
    (458, 'Tom Hardy', (SELECT id FROM characters WHERE character_name = 'Alfie Solomons')),
    (459, 'Mads Mikkelson', (SELECT id FROM characters WHERE character_name = 'Hannibal Lecter')),
    (460, 'Hugh Grant', (SELECT id FROM characters WHERE character_name = 'Will Graham')),
    (461, 'Charlie Cox', (SELECT id FROM characters WHERE character_name = 'Matt Murdock')),
    (462, 'Karl Urban', (SELECT id FROM characters WHERE character_name = 'Billy Butcher')),
    (463, 'Matt Smith', (SELECT id FROM characters WHERE character_name = 'Daemon Targaryen')),
    (464, 'David Harbour', (SELECT id FROM characters WHERE character_name = 'Jim Hopper')),
    (465, 'Pedro Pascal', (SELECT id FROM characters WHERE character_name = 'Din Djarin'));
------------------------------------------------------------------------------------

-- *TESTING QUERIES*

-- Testing query to retrieve all series titles:
SELECT * FROM series;

-- Testing query to Rank all Series in ASC order:
SELECT * FROM ranking ORDER BY earned_rating DESC;

-- Testing query to retrieve all episodes of specific series:
SELECT episode_title FROM episodes WHERE series_id =(
    SELECT id FROM series WHERE title = 'Game of Thrones'
);

-- Testing query to retrieve all characters of specific series:
SELECT character_name FROM characters WHERE series_id = (
    SELECT id FROM series WHERE title = 'Breaking Bad'
);

-- Testing query to filter series of specific genre:
SELECT title FROM series WHERE id IN (
    SELECT series_id FROM series_genre WHERE genre_id = (
        SELECT id FROM genres WHERE genre_name = 'Fantasy'
    )
);

-- Testing query to retrieve actor of specific character:
SELECT actor_name FROM actors WHERE character_id = (
    SELECT id FROM characters WHERE character_name = 'Jon Snow'
);

-- Testing query to DELETE data in Episodes Table:
DELETE FROM episodes WHERE episode_title = 'The Black Queen';

-- Testing query to UPDATE data in Series Table:
UPDATE series SET creator = 'Steven Mofat' WHERE id = 1003;

-- Testing query to INSERT new data in Series Table:
INSERT INTO series (title, release_year, studio_id, creator) VALUES
    ('Succession', 2018, 31, 'Jesse Armstrong');
