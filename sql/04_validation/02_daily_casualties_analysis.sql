USE GazaProject;
GO

SELECT
    YEAR(report_date)                                      AS yr,
    COUNT(*)                                               AS days,
    SUM(killed_daily)                                      AS killed_total,
    SUM(killed_recovered)                                  AS recovered,
    SUM(killed_succumbed)                                  AS succumbed,
    SUM(killed_truce_new)                                  AS truce_new,
    SUM(killed_committee)                                  AS committee,
    SUM(killed_daily - killed_recovered - killed_succumbed
        - killed_truce_new - killed_committee)             AS no_category,
    CAST(100.0 * SUM(killed_committee) / SUM(killed_daily) AS DECIMAL(5,1)) AS committee_pct
FROM silver.casualties_daily
GROUP BY YEAR(report_date)
ORDER BY yr;