IF DB_ID('GazaProject') IS NULL
    CREATE DATABASE GazaProject;
GO

SELECT name, create_date
FROM sys.databases
WHERE name = 'GazaProject';


USE GazaProject;
GO

IF OBJECT_ID('dbo.casualties_daily_raw') IS NOT NULL
    DROP TABLE dbo.casualties_daily_raw;
GO

CREATE TABLE dbo.casualties_daily_raw (
    report_date              DATE         NOT NULL,
    report_source            VARCHAR(20)  NULL,
    report_period            INT          NULL,
    ext_massacres_cum        INT          NULL,
    killed                   INT          NULL,
    killed_cum               INT          NULL,
    ext_killed               INT          NULL,
    ext_killed_cum           INT          NULL,
    ext_killed_children_cum  INT          NULL,
    ext_killed_women_cum     INT          NULL,
    injured_cum              INT          NULL,
    ext_injured              INT          NULL,
    ext_injured_cum          INT          NULL,
    ext_civdef_killed_cum    INT          NULL,
    med_killed_cum           INT          NULL,
    ext_med_killed_cum       INT          NULL,
    press_killed_cum         INT          NULL,
    ext_press_killed_cum     INT          NULL,
    killed_recovered         INT          NULL,
    killed_succumbed         INT          NULL,
    killed_truce_new         INT          NULL,
    killed_committee         INT          NULL,
    child_famine_cum         INT          NULL,
    famine_cum               INT          NULL,
    aid_seeker_killed_cum    INT          NULL,
    aid_seeker_injured_cum   INT          NULL
);
GO

SELECT COUNT(*) AS columns_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'casualties_daily_raw';

USE GazaProject;
GO

IF SCHEMA_ID('bronze') IS NULL EXEC('CREATE SCHEMA bronze');
IF SCHEMA_ID('silver') IS NULL EXEC('CREATE SCHEMA silver');
IF SCHEMA_ID('gold')   IS NULL EXEC('CREATE SCHEMA gold');
GO

IF OBJECT_ID('dbo.casualties_daily_raw') IS NOT NULL
    ALTER SCHEMA bronze TRANSFER dbo.casualties_daily_raw;
GO

SELECT s.name AS layer, t.name AS table_name
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name IN ('bronze', 'silver', 'gold');


USE GazaProject;
GO

TRUNCATE TABLE bronze.casualties_daily_raw;
GO

BULK INSERT bronze.casualties_daily_raw
FROM "D:\Gaza Data\casualties_daily.csv"
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