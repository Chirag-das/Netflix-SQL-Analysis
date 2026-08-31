-- ============================================================
-- PROJECT: NETFLIX DATA ANALYSIS
-- TABLE CREATION
-- TABLE: netflix
-- ============================================================

CREATE TABLE netflix
(
    show_id VARCHAR(6),
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(220),
    casts VARCHAR(1000),
    country VARCHAR(255),
    date_added VARCHAR(70),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in VARCHAR(255),
    description VARCHAR(1000)
);