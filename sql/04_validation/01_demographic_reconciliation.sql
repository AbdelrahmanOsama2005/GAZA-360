USE GazaProject;
GO

WITH list_totals AS (
    SELECT
        COUNT(*)                                                              AS list_total,
        SUM(CASE WHEN life_stage = 'Child' THEN 1 ELSE 0 END)                 AS list_children,
        SUM(CASE WHEN sex = 'Female' AND age >= 18 THEN 1 ELSE 0 END)         AS list_women_18plus
    FROM silver.killed_demographics
)
SELECT
    CONVERT(VARCHAR(10), d.report_date, 23)  AS daily_as_of,
    d.killed_cum                             AS daily_total,
    l.list_total,
    l.list_total - d.killed_cum              AS diff_total,
    d.children_killed_cum                    AS daily_children,
    l.list_children,
    l.list_children - d.children_killed_cum  AS diff_children,
    d.women_killed_cum                       AS daily_women,
    l.list_women_18plus,
    l.list_women_18plus - d.women_killed_cum AS diff_women
FROM silver.casualties_daily d
CROSS JOIN list_totals l
WHERE d.report_date IN ('2026-05-07', '2026-07-05')
ORDER BY d.report_date;