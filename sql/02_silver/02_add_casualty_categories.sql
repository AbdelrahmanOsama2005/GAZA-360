USE GazaProject;
GO

ALTER TABLE silver.casualties_daily ADD
    killed_recovered  INT NOT NULL CONSTRAINT df_sr DEFAULT 0,
    killed_succumbed  INT NOT NULL CONSTRAINT df_ss DEFAULT 0,
    killed_truce_new  INT NOT NULL CONSTRAINT df_st DEFAULT 0,
    killed_committee  INT NOT NULL CONSTRAINT df_sc DEFAULT 0;
GO

UPDATE s
SET s.killed_recovered = ISNULL(b.killed_recovered, 0),
    s.killed_succumbed = ISNULL(b.killed_succumbed, 0),
    s.killed_truce_new = ISNULL(b.killed_truce_new, 0),
    s.killed_committee = ISNULL(b.killed_committee, 0)
FROM silver.casualties_daily s
JOIN bronze.casualties_daily_raw b ON b.report_date = s.report_date;
GO

SELECT SUM(killed_recovered) AS recovered,
       SUM(killed_succumbed) AS succumbed,
       SUM(killed_truce_new) AS truce_new,
       SUM(killed_committee) AS committee
FROM silver.casualties_daily;