# GAZA 360 — Data Source Inventory

## 1. Project Objective

Build a multi-source humanitarian intelligence platform covering the Gaza Strip from October 7, 2023, through the latest reliable available reporting period.

The platform will integrate humanitarian, infrastructure, healthcare, economic, and geospatial datasets.

## 2. Candidate Data Sources

| Source | Domain | Expected Data | Assessment Status |
|---|---|---|---|
| OCHA | Humanitarian Impact | Population impact, displacement, humanitarian indicators | To Assess |
| UNOSAT | Infrastructure | Satellite-based building damage assessments | Identified |
| WHO HeRAMS | Healthcare | Health facilities, operational status, service availability | Initial Dataset Collected |
| UN 2720 Mechanism | Humanitarian Aid | Aid shipments, tracking and delivery information | To Assess |
| World Bank / EU / UN | Economic Recovery | Physical damage, economic losses, recovery needs | Report Identified |
| HDX | Multi-domain | Humanitarian and geographic datasets | To Assess |

## 3. Existing Dataset

### WHO HeRAMS — Gaza Health Facility Status

- Source: WHO
- Snapshot: August 2026
- Records: 6
- Columns: 18
- Geographic Scope: Gaza Strip
- Data Status: Preliminary / Under Verification
- Exact Cutoff Date: Not specified
- Storage: SQL Server Bronze and Silver

## 4. Source Assessment Criteria

Every candidate source must be evaluated using these fields:

1. Official Source Organization
2. Dataset Name
3. Data Domain
4. Geographic Coverage
5. Historical Coverage
6. Publication Date
7. Observation Date
8. Update Frequency
9. Available File Formats
10. API Availability
11. Geographic Coordinates Availability
12. Data Granularity
13. License and Usage Restrictions
14. Data Quality Limitations
15. Collection Method

## 5. Data Engineering Requirements

- Preserve original source files.
- Record source URLs and retrieval timestamps.
- Maintain source-specific metadata.
- Distinguish publication dates from observation dates.
- Preserve historical snapshots.
- Never interpret missing values as zero.
- Never mix reported and estimated values without explicit labels.
- Track changes between dataset versions.
- Avoid double counting overlapping geographic or statistical categories.

## 6. Current Assessment Status

This inventory is an initial source registry, not a completed assessment of data availability.

No source will be considered production-ready until its actual datasets, formats, historical coverage, update frequency, and limitations have been inspected.

## 7. Next Stage

Official Source Investigation and Dataset Discovery.
