USE GazaProject;
GO

IF OBJECT_ID('silver.killed_demographics') IS NOT NULL
    DROP TABLE silver.killed_demographics;
GO

CREATE TABLE silver.killed_demographics (
    record_id     INT IDENTITY(1,1) PRIMARY KEY,
    age           INT         NOT NULL,
    sex           VARCHAR(6)  NOT NULL,
    age_group     VARCHAR(6)  NOT NULL,
    life_stage    VARCHAR(6)  NOT NULL,
    update_batch  INT         NOT NULL
);
GO

INSERT INTO silver.killed_demographics (age, sex, age_group, life_stage, update_batch)
SELECT
    age,
    CASE sex WHEN 'm' THEN 'Male' ELSE 'Female' END,
    CASE
        WHEN age <= 4  THEN '0-4'
        WHEN age <= 14 THEN '5-14'
        WHEN age <= 17 THEN '15-17'
        WHEN age <= 29 THEN '18-29'
        WHEN age <= 44 THEN '30-44'
        WHEN age <= 59 THEN '45-59'
        WHEN age <= 64 THEN '60-64'
        ELSE '65+'
    END,
    CASE
        WHEN age < 18  THEN 'Child'
        WHEN age >= 65 THEN 'Senior'
        ELSE 'Adult'
    END,
    update_batch
FROM bronze.killed_demographics_raw;
GO

SELECT
    age_group,
    SUM(CASE WHEN sex = 'Female' THEN 1 ELSE 0 END) AS females,
    SUM(CASE WHEN sex = 'Male'   THEN 1 ELSE 0 END) AS males,
    COUNT(*)                                        AS total
FROM silver.killed_demographics
GROUP BY age_group
ORDER BY MIN(age);