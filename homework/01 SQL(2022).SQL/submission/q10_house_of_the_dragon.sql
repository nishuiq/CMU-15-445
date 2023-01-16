WITH p AS (
    SELECT titles.primary_title as name, akas.title as dubbed
    FROM titles, akas
    WHERE titles.title_id = akas.title_id
    AND titles.primary_title = 'House of the Dragon' AND titles.type = 'tvSeries'
    GROUP BY titles.primary_title, akas.title
),
c AS (
    SELECT ROW_NUMBER() OVER (ORDER BY name ASC) AS seqnum, dubbed
    FROM p
),
flattened AS (
    SELECT seqnum, dubbed
    FROM c
    WHERE c.seqnum = 1
    UNION ALL
    SELECT c.seqnum , f.dubbed || ', ' || c.dubbed
    FROM c, flattened AS f
    WHERE c.seqnum = f.seqnum + 1
)
SELECT dubbed
FROM flattened
ORDER BY seqnum DESC LIMIT 1;


-- 先把House of the Dragon找出来，并且留下titles.primary_title as name 和 akas.title as dubbed
-- 然后再用 name 进行排序并添加数字
-- 接着使用递归进行合并字符串