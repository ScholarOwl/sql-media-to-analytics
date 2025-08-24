INSERT INTO media_type (name) VALUES
	('Movie'), ('TV'), ('Game');

INSERT INTO platform (name) VALUES
	('PC'), ('PS5'), ('Xbox'), ('Switch'),
    ('Blu-ray'), ('DVD'),
    ('Netflix'), ('Hulu'), ('HBOMax'), ('Disney+'), ('AppleTV'),
    ('Theater');
    
INSERT INTO progress_status (name) VALUES
	('Planning'), ('In-Progress'), ('Completed'), ('Dropped'), ('On-Hold');
    
INSERT INTO genre (name) VALUES
	('Action'), ('Drama'), ('Comedy'), ('Sci-Fi'), ('Horror'), ('Animation'),
    ('Romance'), ('Documentary'), ('Fantasy'), ('Thriller');
    
-- Sample Validation Queries
SELECT * FROM media_type; -- Ensuring 3 media types were created.
SELECT * FROM platform; -- Ensuring 11 platform names were created.
SELECT * FROM progress_status; -- Ensuring 5 statuses were created.
SELECT * FROM genre; -- Ensuring 10 genres were created.

-- Second Validation Query

-- Validation check should return a single row with 4 columns of counts.
SELECT
	(SELECT COUNT(*) FROM media_type)			AS ct_media_type,
    (SELECT COUNT(*) FROM platform)				AS ct_platform,
    (SELECT COUNT(*) FROM progress_status)		AS ct_progress_status,
    (SELECT COUNT(*) FROM genre)				AS ct_genre;

-- All values correctly added and verified within current iteration.