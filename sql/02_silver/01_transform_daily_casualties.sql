USE GazaProject;
GO

IF OBJECT_ID('silver.casualties_daily') IS NOT NULL
    DROP TABLE silver.casualties_daily;
GO

CREATE TABLE silver.casualties_daily (
    report_date          DATE        NOT NULL PRIMARY KEY,
    day_number           INT         NOT NULL,
    source_type          VARCHAR(20) NOT NULL,
    is_estimated         BIT         NOT NULL,
    killed_daily         INT         NOT NULL,
    killed_cum           INT         NOT NULL,
    injured_daily        INT         NOT NULL,
    injured_cum          INT         NOT NULL,
    children_killed_cum  INT         NOT NULL,
    women_killed_cum     INT         NOT NULL,
    civdef_killed_cum    INT         NOT NULL,
    medical_killed_cum   INT         NOT NULL,
    press_killed_cum     INT         NOT NULL,
    massacres_cum        INT         NOT NULL
);
GO

INSERT INTO silver.casualties_daily
SELECT
    report_date,
    DATEDIFF(DAY, '2023-10-07', report_date) + 1,
    CASE report_source
        WHEN 'mohtel' THEN 'MoH'
        WHEN 'gmotel' THEN 'GMO'
        ELSE 'Estimated'
    END,
    CASE WHEN report_source = 'missing' THEN 1 ELSE 0 END,
    ext_killed,
    ext_killed_cum,
    ext_injured,
    ext_injured_cum,
    ext_killed_children_cum,
    ext_killed_women_cum,
    ext_civdef_killed_cum,
    ext_med_killed_cum,
    ext_press_killed_cum,
    ext_massacres_cum
FROM bronze.casualties_daily_raw;
GO

SELECT source_type,
       COUNT(*)         AS days,
       MIN(report_date) AS first_day,
       MAX(report_date) AS last_day
FROM silver.casualties_daily
GROUP BY source_type
ORDER BY days DESC;


USE GazaProject;
GO

WITH calc AS (
    SELECT *,
           killed_cum  - ISNULL(LAG(killed_cum)  OVER (ORDER BY report_date), 0) AS killed_from_cum,
           injured_cum - ISNULL(LAG(injured_cum) OVER (ORDER BY report_date), 0) AS injured_from_cum
    FROM silver.casualties_daily
)
SELECT check_name, result FROM (
    SELECT 1 AS n, 'sum of daily killed'       AS check_name, SUM(killed_daily)  AS result FROM calc
    UNION ALL
    SELECT 2, 'latest cumulative killed',      MAX(killed_cum)                   FROM calc
    UNION ALL
    SELECT 3, 'sum of daily injured',          SUM(injured_daily)                FROM calc
    UNION ALL
    SELECT 4, 'latest cumulative injured',     MAX(injured_cum)                  FROM calc
    UNION ALL
    SELECT 5, 'days killed_daily <> change in cum',
           SUM(CASE WHEN killed_daily <> killed_from_cum THEN 1 ELSE 0 END)      FROM calc
    UNION ALL
    SELECT 6, 'days injured_daily <> change in cum',
           SUM(CASE WHEN injured_daily <> injured_from_cum THEN 1 ELSE 0 END)    FROM calc
) t
ORDER BY n;