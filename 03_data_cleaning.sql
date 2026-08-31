-- ============================================================
-- PROJECT: NETFLIX DATA ANALYSIS
-- DATA CLEANING & DATA QUALITY CHECKS
-- DATABASE: PostgreSQL
-- ============================================================

-- Check total number of records

SELECT COUNT(*) AS total_records
FROM netflix;


-- Check missing values

SELECT
    COUNT(*) AS total_records,
    COUNT(*) FILTER (WHERE show_id IS NULL) AS missing_show_id,
    COUNT(*) FILTER (WHERE type IS NULL) AS missing_type,
    COUNT(*) FILTER (WHERE title IS NULL) AS missing_title,
    COUNT(*) FILTER (WHERE director IS NULL) AS missing_director,
    COUNT(*) FILTER (WHERE country IS NULL) AS missing_country,
    COUNT(*) FILTER (WHERE rating IS NULL) AS missing_rating,
    COUNT(*) FILTER (WHERE duration IS NULL) AS missing_duration
FROM netflix;