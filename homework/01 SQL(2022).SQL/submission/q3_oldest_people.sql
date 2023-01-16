SELECT name, 
case 
    when died IS NULL then 2022 - born
    else died - born
end as age
from people
WHERE born >= 1900
ORDER BY age DESC, name 
LIMIT 20;

-- SELECT name, 
-- case 
--     when died IS NULL then (SELECT STRFTIME('%Y', 'now') - born)
--     else died - born
-- end as age
-- from people
-- WHERE born >= 1900
-- ORDER BY age DESC, name 
-- LIMIT 20;