WITH findtitle (title_id) AS (
    SELECT crew.title_id
    FROM people, crew
    WHERE people.person_id = crew.person_id
    AND people.name like '%Cruise%' AND people.born = '1962'
),
sumrating (title_id, votes) AS (
    SELECT ratings.title_id, ratings.votes
    FROM ratings, findtitle
    WHERE ratings.title_id = findtitle.title_id
    GROUP BY ratings.title_id
)

SELECT titles.primary_title, sumrating.votes
FROM titles, findtitle, sumrating
WHERE titles.title_id = findtitle.title_id
AND titles.title_id = sumrating.title_id
ORDER BY sumrating.votes DESC
LIMIT 10;

-- 先找出这个人所在的剧组（title_id）
-- 然后再找出 title_id 对应的票数和
-- 最后再联合查询名字即可，并对结果做处理。