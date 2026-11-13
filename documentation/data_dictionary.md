# GAZA 360 — Data Dictionary

## Dataset: Health Facility Status

**File Name:** `health_facility_status.csv`  
**Source:** WHO HeRAMS — Gaza Infographics August 2026  
**Geographic Scope:** Gaza Strip  
**Snapshot Period:** August 2026  
**Publication Date:** 2026-09-13  
**Dataset Status:** Preliminary / Under Verification  
**Number of Records:** 6  
**Number of Columns:** 18

## 1. Column Definitions

| Column Name | Data Type | Description |
|---|---|---|
| record_id | Integer (int64) | Unique identifier for each dataset record. |
| source_name | String | Name of the organization providing the data. |
| report_title | String | Official title of the source report. |
| snapshot_period | String | Period represented by the report snapshot. |
| publication_date | Date (YYYY-MM-DD) | Official report publication date. |
| page_number | Integer (int64) | Page number from which the record was extracted. |
| facility_category | String | Health facility category represented by the record. |
| total_evaluated | Integer (int64) | Total number of evaluated facilities in the category. |
| functioning | Integer (int64) | Number of fully functioning facilities. |
| partially_functioning | Integer (int64) | Number of partially functioning facilities. |
| non_functioning | Integer (int64) | Number of non-functioning facilities. |
| destroyed | Integer (int64) | Number of facilities reported as destroyed. |
| published_percentage | Integer (int64) | Percentage published in the original infographic. |
| percentage_description | String | Description of the meaning of the published percentage. |
| geographic_scope | String | Geographic area covered by the record. |
| cutoff_date | Date / NULL | Exact observation cutoff date, if explicitly provided by the source. |
| data_status | String | Verification status of the source data. |
| notes | String | Additional methodological notes and source-specific observations. |

## 2. Data Interpretation Rules

1. Preserve the original categories and values published by WHO.
2. Keep Destroyed separate from Non-Functioning.
3. Do not treat missing cutoff dates as zero or invent an exact date.
4. Preserve published percentages separately from independently calculated percentages.
5. Do not add overlapping facility categories together.
6. Partner Support reporting denominators must not be confused with total evaluated facilities.
7. The report is preliminary and subject to verification.
8. Dates must be parsed explicitly during the data transformation stage.
9. An entirely missing date column may be read as a floating-point column by Pandas; this does not change its logical meaning.

## 3. Data Quality Rules

- `record_id` must be unique and non-null.
- Facility counts must be non-negative integers.
- The sum of functioning, partially functioning, non-functioning, and destroyed facilities should equal total evaluated facilities for these records.
- `published_percentage` must be preserved as published.
- Missing `cutoff_date` values are expected because the report specifies the snapshot month but not an exact cutoff day.
- Source notes must be retained to preserve context and limitations.
- `publication_date` should be converted explicitly to a date/datetime type during transformation.
- `cutoff_date` should remain NULL when the exact observation date is unavailable.

## 4. Observed Data Types in Pandas

The current CSV inspection returned the following data types:

| Data Type | Columns |
|---|---|
| int64 | record_id, page_number, total_evaluated, functioning, partially_functioning, non_functioning, destroyed, published_percentage |
| str | source_name, report_title, snapshot_period, publication_date, facility_category, percentage_description, geographic_scope, data_status, notes |
| float64 | cutoff_date |

**Technical Notes:**

- `publication_date` is currently read as a string (`str`) and must be explicitly converted during the transformation stage.
- `cutoff_date` is currently read as `float64` because all its values are missing (`NaN`).
- Its logical meaning remains Date / NULL, not a