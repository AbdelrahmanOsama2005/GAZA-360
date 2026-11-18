USE GazaProject;
GO

IF OBJECT_ID('gold.monthly_summary') IS NOT NULL
    DROP TABLE gold.monthly_summary;
GO

SELECT
    DATEFROMPARTS(YEAR(report_date), MONTH(report_date), 1) AS month_start,
    COUNT(*)                                   AS days_in_data,
    SUM(killed_daily)                          AS killed_month,
    SUM(injured_daily)                         AS injured_month,
    CAST(AVG(1.0 * killed_daily) AS DECIMAL(10,1)) AS avg_daily_killed,
    MAX(killed_daily)                          AS max_daily_killed,
    MAX(killed_cum)                            AS killed_cum_end
INTO gold.monthly_summary
FROM silver.casualties_daily
GROUP BY DATEFROMPARTS(YEAR(report_date), MONTH(report_date), 1);
GO

SELECT * FROM gold.monthly_summary ORDER BY month_start;