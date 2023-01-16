-- SELECT DISTINCT(title), premiered, runtime_minutes ||' (mins)' from titles, akas
-- where instr(genres, 'Sci-Fi') != 0
-- and titles.title_id = akas.title_id
-- order by runtime_minutes DESC
-- LIMIT 10;

SELECT DISTINCT(primary_title), premiered, runtime_minutes ||' (mins)'
from titles
where instr(genres, 'Sci-Fi') != 0
order by runtime_minutes DESC
LIMIT 10;