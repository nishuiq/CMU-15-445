SELECT COUNT(title_id)  -- title_id 是主键，不可能重复
FROM titles
WHERE titles.premiered in (
    SELECT premiered
    FROM titles
    WHERE primary_title = 'Army of Thieves'
    LIMIT 1
);