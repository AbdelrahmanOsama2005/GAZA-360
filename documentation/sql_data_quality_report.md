# GAZA 360 — SQL Data Quality Report

## 1. Report Information

| Attribute | Value |
|---|---|
| Project | GAZA 360 — Humanitarian Impact & Recovery Intelligence Platform |
| Database | GAZA_360_DB |
| Source Organization | World Health Organization (WHO) |
| Source Report | HeRAMS occupied Palestinian territory: Gaza infographics August 2026 |
| Snapshot Period | August 2026 |
| Dataset | Health Facility Status |
| Source Records | 6 |
| Report Status | Initial Silver Validation Complete |

## 2. Data Architecture

The dataset was processed using the Medallion Architecture:

- **Bronze Layer:** Stores the extracted staging records.
- **Silver Layer:** Stores cleaned and typed records, ready for further analysis.

SQL Tables:

- `bronze.health_facility_status`
- `silver.health_facility_status`

## 3. Data Transformation

The following transformations were applied when transferring data from Bronze to Silver:

1. Removed leading and trailing whitespace from text fields.
2. Converted `publication_date` from text to SQL DATE.
3. Converted `cutoff_date` to SQL DATE while preserving missing values as NULL.
4. Preserved the original published percentages.
5. Preserved source categories and descriptive notes.
6. Kept Bronze data unchanged.

## 4. Data Quality Results

| Quality Check | Expected / Actual Result | Status |
|---|---:|---|
| Total Records | 6 | PASS |
| Unique Record IDs | 6 | PASS |
| Missing Publication Dates | 0 | PASS |
| Missing Cutoff Dates | 6 | EXPECTED |
| Inconsistent Facility Totals | 0 | PASS |
| Percentage Consistency | 6 of 6 | PASS |

### Missing Values Explanation

All six `cutoff_date` values are NULL because the source report does not specify an exact cutoff date. These values were not replaced with assumed dates.

## 5. Percentage Validation

Published percentages were compared with percentages calculated using:

`Partially Functioning / Total Evaluated × 100`

| Facility Category | Published % | Calculated % | Result |
|---|---:|---:|---|
| All HSDUs | 51% | 51% | Consistent |
| All Hospitals | 51% | 51% | Consistent |
| All Health Centers | 49% | 49% | Consistent |
| Government PHCs | 27% | 27% | Consistent |
| UNRWA Health Centers | 42% | 42% | Consistent |
| NGO Health Centers | 68% | 68% | Consistent |

All six published percentages are consistent with the calculated percentages after rounding.

## 6. Methodological Limitations

- HeRAMS August 2026 data is marked Preliminary / Under Verification.
- An exact cutoff date is not specified in the report.
- Aggregate facility categories may overlap with their subcategories.
- Published percentages are retained as reported and are not replaced by calculated values.
- Arithmetic consistency does not independently verify the accuracy of the original field assessments.
- Destroyed and Non-Functioning remain separate categories.

## 7. Conclusion

The initial Silver Layer validation was completed successfully.

Six health facility records were transferred from Bronze to Silver, with date conversion, text trimming, and successful arithmetic and percentage consistency checks.

The dataset is ready for the next stage of development, subject to the documented source limitations.

**Next Planned Stage:** Gold Layer — Analytical Data Modeling.
