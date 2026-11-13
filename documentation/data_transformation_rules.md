# GAZA 360 — Data Transformation Rules

## Dataset: Health Facility Status

**Source File:** `data/staging/health_facility_status.csv`  
**Target Stage:** `data/processed/`  
**Transformation Tool:** Python (Pandas)

## 1. Column Name Standardization

- Remove leading and trailing whitespace from column names.
- Preserve consistent snake_case naming.
- Do not rename source fields without documenting the change.

## 2. Text Data Cleaning

- Remove leading and trailing whitespace from text values.
- Preserve the original meaning of source descriptions.
- Do not replace missing text values with invented information.
- Preserve source-specific notes.

## 3. Date Transformation

- Convert `publication_date` from string to datetime.
- Keep `cutoff_date` as NULL because the exact observation date is not specified.
- Do not infer an exact date from the snapshot month.
- Preserve `snapshot_period` as the original reporting period.

## 4. Numeric Data Validation

- Ensure facility counts are numeric integers.
- Ensure facility counts are non-negative.
- Validate that the sum of the four operational status categories equals `total_evaluated`.
- Preserve `published_percentage` exactly as reported.

## 5. Missing Values Handling

- Do not replace missing `cutoff_date` values with zero.
- Do not invent missing dates or facility counts.
- Keep missing values distinguishable from actual zero values.
- Document any missing values that affect interpretation.

## 6. Duplicate Handling

- Check `record_id` uniqueness.
- Check for duplicate records.
- Do not automatically delete records without investigating their meaning.

## 7. Category Integrity

- Keep Destroyed separate from Non-Functioning.
- Do not combine facility categories without verified source definitions.
- Do not sum overlapping aggregate and subgroup records.

## 8. Derived Metrics

- Calculate derived percentages in separate fields.
- Never overwrite percentages published by WHO.
- Document the formula used for every derived metric.

## 9. Output Requirements

- Save the transformed dataset under `data/processed/`.
- Preserve the original staging CSV unchanged.
- Maintain the original source values and traceability.
- Run data quality checks after transformation.

**Important:** These rules define the intended transformation process. They do not indicate that the transformations have already been executed.