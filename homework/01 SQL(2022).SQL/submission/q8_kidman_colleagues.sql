-- SELECT DISTINCT(name)
-- FROM crew, people
-- WHERE crew.person_id = people.person_id
-- and crew.title_id in (
--     SELECT c1.title_id
--     FROM people as p1, crew as c1
--     WHERE p1.name = 'Nicole Kidman' and p1.born = '1967'
--     and p1.person_id = c1.person_id
-- )
-- and crew.category in ('actor', 'actress')
-- ORDER BY name;



WITH findpeople (title_id) AS (
    SELECT title_id
    FROM people, crew
    WHERE people.name = 'Nicole Kidman' and people.born = '1967'
    and people.person_id = crew.person_id
)
SELECT DISTINCT(name)
FROM crew, people, findpeople
WHERE crew.person_id = people.person_id
and crew.title_id = findpeople.title_id
and crew.category in ('actor', 'actress')
ORDER BY name;