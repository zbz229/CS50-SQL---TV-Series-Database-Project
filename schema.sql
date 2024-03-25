-- Schema.sql for final project of TV Series Database
-- Contents:
    -- Ln 7 - Creating Tables 
    -- Ln 69 - Creating Views
    -- Ln 83 - Creating Indexes

-- *CREATING TABLES*

-- Query for Creating Table: Series
CREATE TABLE Series (
    id INtEGER PRIMARY KEY, -- series_id ranges 1001 to 1100
    title VARCHAR(150) NOT NULL,
    studio_id INTEGER REFERENCES Studios(id) ON DELETE CASCADE ON UPDATE CASCADE,
    release_year INTEGER,
    creator TEXT
);

-- Query for Creating Table: Studios
CREATE TABLE Studios (
    id INTEGER PRIMARY KEY, -- studio_id ranges 31 to 40
    studio_name VARCHAR(150) UNIQUE NOT NULL
);

-- Query for Creating Table: Genres
CREATE TABLE Genres (
    id INTEGER PRIMARY KEY, -- genre_id ranges 51 to 60
    genre_name VARCHAR(150) UNIQUE NOT NULL
);

-- Query for Creating Table: Series_Genres 
-- (Many-to-Many relationship between Series and Genres)
CREATE TABLE Series_Genre (
    id INTEGER PRIMARY KEY, --Series_genre_id ranges 71 to 100
    series_id INTEGER REFERENCES Series(id) ON DELETE CASCADE ON UPDATE CASCADE,
    genre_id INTEGER REFERENCES Genres(id) ON DELETE CASCADE ON UPDATE CASCADE
);

--Query for Creating Table: Ranking
CREATE TABLE Ranking (
    series_title VARCHAR(150) UNIQUE REFERENCES Series(title) ON DELETE CASCADE ON UPDATE CASCADE, 
    earned_rating BOOLEAN NOT NULL, 
    rank VARCHAR(150) UNIQUE NOT NULL
);

-- Query for Creating Table: Episodes
CREATE TABLE Episodes (
    id INTEGER PRIMARY KEY, --episode_id ranges 701 to 1000
    series_id INTEGER REFERENCES Series(id) ON DELETE CASCADE ON UPDATE CASCADE,
    episode_title VARCHAR(150) UNIQUE NOT NULL,
    imdb_rating BOOLEAN 
);

-- Query for Creating Table: Characters
CREATE TABLE Characters (
    id INTEGER PRIMARY KEY, --characters_id ranges 251 to 300
    character_name VARCHAR(150) UNIQUE NOT NULL,
    series_id INTEGER REFERENCES Series(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Query for Creating Table: Actors
CREATE TABLE Actors (
    id INTEGER PRIMARY KEY, -- actors_id ranges 451 to 500
    actor_name VARCHAR(150) NOT NULL,
    character_id INTEGER REFERENCES Characters(id) ON DELETE CASCADE ON UPDATE CASCADE
);
------------------------------------------------------------------------------------

-- *CREATING VIEWS*

Go -- using go to saparate batches

-- View: Series_with_Genres
CREATE VIEW Series_Full_View AS
SELECT s.id AS series_id, s.title AS series_title, s.release_year, s.creator,
       st.studio_name, g.genre_name FROM Series s
JOIN Studios st ON s.studio_id = st.id
JOIN Series_Genre sg ON s.id = sg.series_id
JOIN Genres g ON sg.genre_id = g.id;

Go -- using go to saparate batches

-- View: Episodes_with_Ratings
CREATE VIEW Episodes_Ratings_View AS
SELECT e.id AS episode_id, e.episode_title, e.imdb_rating, s.title AS series_title FROM Episodes e
JOIN Series s ON e.series_id = s.id;

Go -- using go to saparate batches
------------------------------------------------------------------------------------

-- *CREATING INDEXES*

-- Index 1: Index on Series table for title column
CREATE INDEX idx_series_title ON Series(title);

-- Index 2: Index on Episodes table for series_id column
CREATE INDEX idx_episodes_series_id ON Episodes(series_id);

-- Index 3: Index on Characters table for series_id column
CREATE INDEX idx_characters_series_id ON Characters(series_id);

-- Index 4: Index on Actors table for character_id column
CREATE INDEX idx_actors_character_id ON Actors(character_id);

-- Index 5: Composite Index on Series_Genre table for series_id and genre_id columns
CREATE INDEX idx_series_genre_series_genre_id ON Series_Genre(series_id, genre_id);
------------------------------------------------------------------------------------
