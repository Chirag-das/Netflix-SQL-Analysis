 # Netflix SQL Data Analysis

## Project Overview

This project analyzes Netflix Movies and TV Shows using PostgreSQL and SQL.

The objective is to explore Netflix's content catalog and answer 22 practical
business questions related to content types, ratings, genres, countries,
directors, actors, release trends, and content characteristics.

The project demonstrates practical SQL skills including data cleaning,
filtering, aggregation, string manipulation, date analysis, window functions,
and business-oriented data analysis.

---

## Business Objective

The main objective of this project is to analyze Netflix's content library
and generate meaningful insights that can help understand:

- Movies vs TV Shows distribution
- Popular content ratings
- Content production by country
- Popular genres
- Movie duration and TV Show seasons
- Netflix content addition trends
- Directors and actors with significant representation
- Indian content trends
- Content classification based on description keywords

---

## Dataset

The dataset contains information about Netflix Movies and TV Shows.

### Main Columns

| Column | Description |
|---|---|
| `show_id` | Unique identifier for each title |
| `type` | Movie or TV Show |
| `title` | Name of the content |
| `director` | Director of the content |
| `casts` | Cast members |
| `country` | Country or countries associated with the content |
| `date_added` | Date the content was added to Netflix |
| `release_year` | Original release year |
| `rating` | Content rating |
| `duration` | Movie duration or number of TV Show seasons |
| `listed_in` | Genres/categories |
| `description` | Description of the content |

---

## Tools & Technologies

- PostgreSQL
- SQL
- pgAdmin 4
- Git
- GitHub
- CSV Dataset

---

## SQL Skills Demonstrated

This project demonstrates the following SQL concepts:

- SELECT statements
- WHERE filtering
- GROUP BY
- ORDER BY
- Aggregate functions
- COUNT()
- AVG()
- CASE statements
- String manipulation
- `STRING_TO_ARRAY()`
- `UNNEST()`
- `SPLIT_PART()`
- `ILIKE`
- Date functions
- Common Table Expressions (CTEs)
- Window functions
- LATERAL JOIN
- Data quality checks
- Business-oriented SQL analysis

---

## Business Problems

The project answers the following 22 business questions:

### Content Analysis

1. Count the number of Movies vs TV Shows.
2. Find the most common rating for Movies and TV Shows.
3. List all movies released in a specific year.
4. Find the top 5 countries with the most Netflix content.
5. Identify the longest movie.
6. Find content added in the last 5 years.

### Director & TV Show Analysis

7. Find all Movies/TV Shows by director `Rajiv Chilaka`.
8. List all TV Shows with more than 5 seasons.
9. Count the number of content items in each genre.

### Indian Content Analysis

10. Find the top 5 years with the highest number of Netflix
content releases from India.
11. List all movies that are documentaries.
12. Find all content without a director.
13. Find how many movies actor `Salman Khan` appeared in during
the last 10 years.
14. Find the top 10 actors who have appeared in the highest number
of movies produced in India.

### Advanced Content Analysis

15. Categorize content as `Good` or `Bad` based on the presence of
the keywords `kill` and `violence` in the description.
16. Find the percentage of Movies vs TV Shows.
17. Find the top 10 genres with the highest number of Netflix titles.
18. Find the number of titles added to Netflix each year.
19. Find the top 10 countries with the highest number of movies.
20. Find the average movie duration by release year.
21. Find the top 10 directors with the most Netflix titles.
22. Find the distribution of content by rating.

---
