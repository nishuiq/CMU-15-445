SELECT CAST(premiered / 10 * 10 AS varchar) || 's' AS decade,
ROUND(AVG(rating), 2) AS avg_rating,
MAX(rating) AS top_rating, 
MIN(rating) AS min_rating,
count(*) AS num_releases
FROM titles, ratings
WHERE titles.title_id = ratings.title_id
AND premiered IS NOT NULL
GROUP BY decade
ORDER BY avg_rating DESC, decade;