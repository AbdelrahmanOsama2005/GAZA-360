USE GazaProject;
GO

TRUNCATE TABLE bronze.casualties_daily_raw;
GO

BULK INSERT bronze.casualties_daily_raw
FROM 'D:\Gaza Data\casualties_daily.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    KEEPNULLS,
    TABLOCK
);
GO

SELECT COUNT(*)         AS total_rows,
       MIN(report_date) AS first_day,
       MAX(report_date) AS last_day
FROM bronze.casualties_daily_raw;

USE GazaProject;
GO

WITH ordered AS (
    SELECT *,
           LAG(ext_killed_cum) OVER (ORDER BY report_date) AS prev_cum
    FROM bronze.casualties_daily_raw
)
SELECT check_name, result FROM (
    SELECT 1 AS n, 'total rows' AS check_name,
           COUNT(*) AS result FROM ordered
    UNION ALL
    SELECT 2, 'duplicate dates',
           COUNT(*) - COUNT(DISTINCT report_date) FROM ordered
    UNION ALL
    SELECT 3, 'missing days in range',
           DATEDIFF(DAY, MIN(report_date), MAX(report_date)) + 1 - COUNT(*) FROM ordered
    UNION ALL
    SELECT 4, 'killed is NULL',
           SUM(CASE WHEN killed IS NULL THEN 1 ELSE 0 END) FROM ordered
    UNION ALL
    SELECT 5, 'killed_cum is NULL',
           SUM(CASE WHEN killed_cum IS NULL THEN 1 ELSE 0 END) FROM ordered
    UNION ALL
    SELECT 6, 'ext_killed_cum decreases',
           SUM(CASE WHEN ext_killed_cum < prev_cum THEN 1 ELSE 0 END) FROM ordered
    UNION ALL
    SELECT 7, 'children+women > total',
           SUM(CASE WHEN ext_killed_children_cum + ext_killed_women_cum > ext_killed_cum THEN 1 ELSE 0 END) FROM ordered
    UNION ALL
    SELECT 8, 'source = missing',
           SUM(CASE WHEN report_source = 'missing' THEN 1 ELSE 0 END) FROM ordered
) t
ORDER BY n;