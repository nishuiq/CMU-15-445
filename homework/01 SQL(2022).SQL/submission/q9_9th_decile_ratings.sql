WITH actor_movie_1955 AS (
    SELECT people.person_id, people.name, titles.title_id
    FROM people, crew, titles
    WHERE people.person_id = crew.person_id
    AND crew.title_id = titles.title_id
    AND people.born = '1955' AND titles.type = 'movie'
),
actor_rating AS (
    SELECT actor_movie_1955.name, ROUND(AVG(ratings.rating),2) AS rating
    FROM actor_movie_1955, ratings
    WHERE actor_movie_1955.title_id = ratings.title_id
    GROUP BY actor_movie_1955.person_id
),
quantiles AS (
    SELECT *, NTILE(10) OVER (ORDER BY rating ASC) AS rating_quantile
    FROM actor_rating
)
SELECT name, rating 
FROM quantiles
WHERE rating_quantile = 9
ORDER BY rating DESC, name ASC;