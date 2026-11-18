USE GazaProject;
GO

IF OBJECT_ID('gold.age_sex_summary') IS NOT NULL
    DROP TABLE gold.age_sex_summary;
GO

SELECT
    age_group,
    MIN(age)                                                    AS sort_age,
    SUM(CASE WHEN sex = 'Female' THEN 1 ELSE 0 END)             AS females,
    SUM(CASE WHEN sex = 'Male'   THEN 1 ELSE 0 END)             AS males,
    COUNT(*)                                                    AS total,
    CAST(100.0 * COUNT(*) / SUM(COUNT(*)) OVER () AS DECIMAL(5,1)) AS pct_of_total,
    CAST(100.0 * SUM(CASE WHEN sex = 'Female' THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,1))                            AS female_pct_in_group
INTO gold.age_sex_summary
FROM silver.killed_demographics
GROUP BY age_group;
GO

SELECT * FROM gold.age_sex_summary ORDER BY sort_age;