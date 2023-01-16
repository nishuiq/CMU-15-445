SELECT name, (SELECT COUNT(*) from crew WHERE crew.person_id = people.person_id) as cnt
from people
ORDER BY cnt DESC
LIMIT 20;