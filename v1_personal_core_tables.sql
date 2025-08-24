USE media_v1;

CREATE TABLE media_item (
	media_id INT auto_increment PRIMARY KEY,
    
    title VARCHAR(255) NOT NULL,
    media_type_id INT NOT NULL,
    release_date DATE NULL,
    platform_id INT NULL,
    status_id INT NOT NULL,
    
    rating DECIMAL(3,2) NULL,
    review TEXT NULL,
    
    added_at		DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at		DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_media_item_type
		FOREIGN KEY (media_type_id)		REFERENCES media_type(media_type_id),
	CONSTRAINT fk_media_item_platform
		FOREIGN KEY (platform_id)		REFERENCES platform(platform_id),
	CONSTRAINT fk_media_item_status
		FOREIGN KEY (status_id) 		REFERENCES progress_status(status_id),
        
	CONSTRAINT chk_rating_range CHECK (rating IS NULL OR (rating >= 0.00 AND rating <= 10.00))
) ENGINE=InnoDB;

CREATE INDEX ix_media_item_type			ON media_item(media_type_id);
CREATE INDEX ix_media_item_platform		ON media_item(platform_id);
CREATE INDEX ix_media_item_status		ON media_item(status_id);
CREATE INDEX ix_media_item_rel_date		ON media_item(release_date);

CREATE TABLE media_genre (
	media_id INT NOT NULL,
    genre_id INT NOT NULL,
    
    PRIMARY KEY (media_id, genre_id),
    
    CONSTRAINT fk_mg_media FOREIGN KEY (media_id)
		REFERENCES media_item(media_id)
        ON DELETE CASCADE,
        
	CONSTRAINT fk_mg_genre FOREIGN KEY (genre_id)
		REFERENCES genre(genre_id)
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX ix_my_genre ON media_genre(genre_id);