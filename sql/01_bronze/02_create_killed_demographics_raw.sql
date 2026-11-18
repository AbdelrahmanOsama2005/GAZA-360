USE GazaProject;
GO

IF OBJECT_ID('bronze.killed_demographics_raw') IS NOT NULL
    DROP TABLE bronze.killed_demographics_raw;
GO

CREATE TABLE bronze.killed_demographics_raw (
    age           INT     NOT NULL,
    sex           CHAR(1) NOT NULL,
    update_batch  INT     NOT NULL
);
GO

BULK INSERT bronze.killed_demographics_raw
FROM 'D:\Gaza Data\killed_demographics.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

SELECT COUNT(*)                                          AS total_rows,
       SUM(CASE WHEN sex = 'm' THEN 1 ELSE 0 END)        AS males,
       SUM(CASE WHEN sex = 'f' THEN 1 ELSE 0 END)        AS females,
       MIN(age)                                          AS min_age,
       MAX(age)                                          AS max_age,
       SUM(CASE WHEN age < 18 THEN 1 ELSE 0 END)         AS under_18
FROM bronze.killed_demographics_raw;