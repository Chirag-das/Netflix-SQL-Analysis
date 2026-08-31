-- ============================================================
-- PROJECT: NETFLIX DATA ANALYSIS
-- DATABASE: PostgreSQL
-- AUTHOR: Chirag Das
-- ============================================================
--
-- DESCRIPTION:
-- This project analyzes Netflix Movies and TV Shows using SQL
-- to answer business questions related to content distribution,
-- ratings, genres, countries, actors, directors and trends.
--
-- ============================================================


-- ============================================================
-- BUSINESS PROBLEM 01
-- Count the number of Movies vs TV Shows
-- ============================================================

SELECT
    type,
    COUNT(*) AS total_content
FROM netflix
GROUP BY type
ORDER BY total_content DESC;


-- ============================================================
-- BUSINESS PROBLEM 02
-- Find the most common rating for Movies and TV Shows
-- ============================================================

SELECT
    type,
    rating,
    COUNT(*) AS rating_count
FROM netflix
GROUP BY type, rating
ORDER BY type, rating_count DESC;


-- ============================================================
-- BUSINESS PROBLEM 03
-- List all movies released in a specific year (2020)
-- ============================================================

SELECT
    title,
    release_year
FROM netflix
WHERE type = 'Movie'
  AND release_year = 2020
ORDER BY title;


-- ============================================================
-- BUSINESS PROBLEM 04
-- Find the top 5 countries with the most Netflix content
-- ============================================================

SELECT
    country,
    COUNT(*) AS total_content
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC
LIMIT 5;


-- ============================================================
-- BUSINESS PROBLEM 05
-- Identify the longest movie
-- ============================================================

SELECT
    title,
    duration
FROM netflix
WHERE type = 'Movie'
  AND duration IS NOT NULL
ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) DESC
LIMIT 1;


-- ============================================================
-- BUSINESS PROBLEM 06
-- Find content added in the last 5 years
-- ============================================================

SELECT
    title,
    type,
    date_added
FROM netflix
WHERE date_added IS NOT NULL
  AND TO_DATE(TRIM(date_added), 'Month DD, YYYY')
      >= CURRENT_DATE - INTERVAL '5 years'
ORDER BY TO_DATE(TRIM(date_added), 'Month DD, YYYY') DESC;


-- ============================================================
-- BUSINESS PROBLEM 07
-- Find all Movies/TV Shows by director 'Rajiv Chilaka'
-- ============================================================

SELECT
    title,
    type,
    director
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%';


-- ============================================================
-- BUSINESS PROBLEM 08
-- List all TV Shows with more than 5 seasons
-- ============================================================

SELECT
    title,
    duration
FROM netflix
WHERE type = 'TV Show'
  AND duration IS NOT NULL
  AND CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 5
ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) DESC;


-- ============================================================
-- BUSINESS PROBLEM 09
-- Count the number of content items in each genre
-- ============================================================

SELECT
    TRIM(genre) AS genre,
    COUNT(*) AS total_content
FROM netflix
CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre
WHERE listed_in IS NOT NULL
GROUP BY TRIM(genre)
ORDER BY total_content DESC;


-- ============================================================
-- BUSINESS PROBLEM 10
-- Find each year and the average number of content releases
-- in India on Netflix.
-- Return the top 5 years with the highest average content release.
-- ============================================================

WITH india_content AS (
    SELECT
        release_year,
        COUNT(*) AS content_count
    FROM netflix
    WHERE country ILIKE '%India%'
    GROUP BY release_year
)
SELECT
    release_year,
    content_count AS average_content_release
FROM india_content
ORDER BY average_content_release DESC
LIMIT 5;


-- ============================================================
-- BUSINESS PROBLEM 11
-- List all movies that are documentaries
-- ============================================================

SELECT
    title,
    type,
    listed_in
FROM netflix
WHERE type = 'Movie'
  AND listed_in ILIKE '%Documentaries%'
ORDER BY title;


-- ============================================================
-- BUSINESS PROBLEM 12
-- Find all content without a director
-- ============================================================

SELECT
    title,
    type,
    director
FROM netflix
WHERE director IS NULL
   OR TRIM(director) = ''
ORDER BY title;


-- ============================================================
-- BUSINESS PROBLEM 13
-- Find how many movies actor 'Salman Khan' appeared in
-- during the last 10 years
-- ============================================================

SELECT
    COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
  AND casts ILIKE '%Salman Khan%'
  AND release_year >= EXTRACT(YEAR FROM CURRENT_DATE) - 10;


-- ============================================================
-- BUSINESS PROBLEM 14
-- Find the top 10 actors who have appeared in the highest
-- number of movies produced in India
-- ============================================================

SELECT
    TRIM(actor) AS actor,
    COUNT(*) AS movie_count
FROM netflix
CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(casts, ',')) AS actor
WHERE type = 'Movie'
  AND country ILIKE '%India%'
  AND casts IS NOT NULL
GROUP BY TRIM(actor)
ORDER BY movie_count DESC
LIMIT 10;


-- ============================================================
-- BUSINESS PROBLEM 15
-- Categorize content based on the presence of the keywords
-- 'kill' and 'violence' in the description.
-- Label as 'Bad' or 'Good' and count each category.
-- ============================================================

SELECT
    CASE
        WHEN description ILIKE '%kill%'
          OR description ILIKE '%violence%'
        THEN 'Bad'
        ELSE 'Good'
    END AS content_category,
    COUNT(*) AS total_content
FROM netflix
GROUP BY content_category
ORDER BY total_content DESC;


-- ============================================================
-- BUSINESS PROBLEM 16
-- Find the percentage of Movies vs TV Shows
-- ============================================================

SELECT
    type,
    COUNT(*) AS total_content,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM netflix
GROUP BY type
ORDER BY percentage DESC;


-- ============================================================
-- BUSINESS PROBLEM 17
-- Find the top 10 genres with the highest number
-- of Netflix titles
-- ============================================================

SELECT
    TRIM(genre) AS genre,
    COUNT(*) AS total_titles
FROM netflix
CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre
WHERE listed_in IS NOT NULL
GROUP BY TRIM(genre)
ORDER BY total_titles DESC
LIMIT 10;


-- ============================================================
-- BUSINESS PROBLEM 18
-- Find the number of titles added to Netflix each year
-- ============================================================

SELECT
    EXTRACT(
        YEAR FROM TO_DATE(TRIM(date_added), 'Month DD, YYYY')
    ) AS year_added,
    COUNT(*) AS total_titles_added
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;


-- ============================================================
-- BUSINESS PROBLEM 19
-- Find the top 10 countries with the highest number of movies
-- ============================================================

SELECT
    TRIM(country_name) AS country,
    COUNT(*) AS movie_count
FROM netflix
CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(country, ',')) AS country_name
WHERE type = 'Movie'
  AND country IS NOT NULL
GROUP BY TRIM(country_name)
ORDER BY movie_count DESC
LIMIT 10;


-- ============================================================
-- BUSINESS PROBLEM 20
-- Find the average movie duration by release year
-- ============================================================

SELECT
    release_year,
    ROUND(
        AVG(
            CAST(SPLIT_PART(duration, ' ', 1) AS NUMERIC)
        ),
        2
    ) AS average_movie_duration_minutes
FROM netflix
WHERE type = 'Movie'
  AND duration IS NOT NULL
GROUP BY release_year
ORDER BY release_year;


-- ============================================================
-- BUSINESS PROBLEM 21
-- Find the top 10 directors with the most Netflix titles
-- ============================================================

SELECT
    TRIM(director_name) AS director,
    COUNT(*) AS total_titles
FROM netflix
CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(director, ',')) AS director_name
WHERE director IS NOT NULL
  AND TRIM(director) <> ''
GROUP BY TRIM(director_name)
ORDER BY total_titles DESC
LIMIT 10;


-- ============================================================
-- BUSINESS PROBLEM 22
-- Find the distribution of content by rating and identify
-- the most popular rating category
-- ============================================================

SELECT
    rating,
    COUNT(*) AS total_content
FROM netflix
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total_content DESC;