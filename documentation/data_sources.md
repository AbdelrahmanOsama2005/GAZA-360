
# GAZA 360 — Data Sources Registry

## 1. Project Information

- Project Name: GAZA 360
- Project Type: End-to-End Data Analytics
- Geographic Scope: Gaza Strip
- Analysis Start Date: 2023-10-07
- Registry Created: 2026-11-08
- Project Status: In Progress

### Project Purpose

To analyze the humanitarian, infrastructure, healthcare, and
economic impacts of the conflict in Gaza using reliable,
documented, and verifiable data sources.

---

## 2. Primary Data Sources

### Source 01: OCHA

**Organization:** United Nations Office for the Coordination
of Humanitarian Affairs — Occupied Palestinian Territory

- Official Website:
  https://www.ochaopt.org/
- Data Portal:
  https://www.ochaopt.org/data

**Data Categories:**

- Casualties
- Demolitions and Displacement
- Gaza Crossings
- Electricity
- Critical Humanitarian Indicators
- Humanitarian Needs

**Data Type:** Humanitarian indicators and operational information.

**Geographic Coverage:** Occupied Palestinian Territory,
including the Gaza Strip.

**Planned Usage:**

- Humanitarian impact analysis.
- Displacement monitoring.
- Casualty trend analysis, where accessible.
- Humanitarian access monitoring.

**Access Status:** Public and partner-restricted resources
may both exist. Access must be checked for each dataset.

**Data Limitations:**

- Some interactive tools are restricted to operational partners.
- Observation dates and publication dates must be recorded separately.
- Definitions and reporting coverage may change over time.

---

### Source 02: UNOSAT

**Organization:** United Nations Satellite Centre (UNOSAT)

- Official Website:
  https://unosat.org/
- Gaza Emergency Response Data Hub:
  https://gaza-unosat.hub.arcgis.com/
- Data Download Portal:
  https://gaza-unosat.hub.arcgis.com/pages/data

**Data Categories:**

- Building Damage
- Infrastructure Damage
- Geographic Damage Distribution
- Satellite-Based Damage Assessments

**Data Type:** Satellite imagery-based geospatial assessments.

**Geographic Coverage:** Gaza Strip.

**Verified Example Product:**

- Product Name: Gaza Strip Comprehensive Damage Assessment
- Product ID: 4165
- Publication Date: 2025-08-05
- Imagery Date: 2025-07-08
- Available Formats: PDF and GDB
- Product Page:
  https://unosat.org/products/4165

**Planned Usage:**

- Geospatial damage analysis.
- Infrastructure damage mapping.
- Governorate-level comparisons.
- Geographic visualization using GeoPandas and Power BI.

**Data Limitations:**

- Satellite assessments represent specific imagery dates,
  not daily observations.
- Some assessments are preliminary and may not be field-validated.
- Damage classifications and methodology must be reviewed.
- Different assessment dates should not be treated as directly
  comparable without checking their methodology and coverage.

---

### Source 03: World Bank / United Nations / European Union

**Organizations:**

- World Bank
- United Nations
- European Union

**Report Title:**

Gaza Strip Rapid Damage and Needs Assessment (RDNA)

- Publication Date: 2026-04-20
- Assessment Period: October 2023 – October 2025
- Geographic Coverage: Gaza Strip

**Official Report Page:**

https://thedocs.worldbank.org/en/doc/e539cbf23b348c3d4fc69b8a7e9c9d7d-0280062026/original/

**Official PDF:**

https://thedocs.worldbank.org/en/doc/e539cbf23b348c3d4fc69b8a7e9c9d7d-0280062026/original/Gaza-RDNA-2026-Final-April-19.pdf

**Data Categories:**

- Physical Infrastructure Damage
- Economic Losses
- Housing
- Healthcare
- Education
- Agriculture
- Employment
- Recovery and Reconstruction Needs

**Data Type:** Aggregated assessments, estimates, and
sector-level analysis.

**Planned Usage:**

- Economic impact analysis.
- Recovery and reconstruction analysis.
- Sector-level comparisons.
- Supporting context for analytical findings.

**Data Limitations:**

- Figures are assessment estimates, not daily measurements.
- The report covers a defined assessment period.
- Methodology and assumptions must be documented.
- The report does not replace detailed sector-specific assessments.
- Data collection includes remote methods and ground-based inputs.

---

## 3. Data Governance Rules

The following rules will apply to every dataset used in GAZA 360:

1. Preserve original downloaded files in `data/raw/`.
2. Never overwrite raw source data.
3. Record the original source URL for every dataset.
4. Record the download date.
5. Record publication date and observation date separately.
6. Distinguish reported figures from estimates.
7. Never interpret missing values as zero.
8. Document all cleaning and transformation steps.
9. Record dataset versions and geographic coverage.
10. Document assumptions, limitations, and methodology.
11. Check licensing and permitted reuse before redistribution.
12. Preserve original units and definitions whenever possible.

---

## 4. Dataset Metadata Requirements

For every dataset selected, record:

| Field | Description |
|---|---|
| Dataset ID | Unique project identifier |
| Dataset Name | Original dataset title |
| Organization | Publishing organization |
| Source URL | Original source link |
| Publication Date | Date published |
| Observation Date | Date represented by the data |
| Download Date | Date downloaded |
| Geographic Coverage | Area covered |
| File Format | CSV, XLSX, PDF, GDB, etc. |
| Data Type | Reported, estimated, or modeled |
| License | Usage and redistribution terms |
| Limitations | Known data limitations |
| Validation Status | Pending or validated |

---

## 5. Source Validation Status

| Source | Research Status | Download Status |
|---|---|---|
| OCHA | Identified | Pending |
| UNOSAT | Identified | Pending |
| World Bank / UN / EU | Identified | Pending |

**Important:**

Identifying a source does not mean its data has been
downloaded, validated, cleaned, or integrated into the project.

All datasets must pass a source and quality review before
being used in the analytical process.

---

## 6. Next Research Activities

- Review available OCHA datasets.
- Inspect UNOSAT downloadable geospatial products.
- Review the World Bank RDNA report and its methodology.
- Identify suitable machine-readable datasets.
- Evaluate data coverage and quality.
- Document selected datasets before downloading.

---

**GAZA 360 — Building insights from reliable data.**
## WHO — Gaza Health Access 2022

- Organization: World Health Organization (WHO)
- Geographic Coverage: Gaza Strip
- Reference Year: 2022
- Domain: Health
- Data Type: Historical Health Access Indicators
- Source: Gaza Health Access 2022 Fact Sheet
- Data Format: One-page PDF / Fact Sheet

### Key Indicators

- Patient Permit Applications: 20,295
- Patient Applications Delayed or Denied: 33%
- Companion Permit Applications: 26,461
- Companion Applications Delayed or Denied: 62%
- Patients Exited Without Companion: 25%
- Patients Delayed at Erez Checkpoint: 935
- Lost Hospital Appointments: 289

### Data Quality Notes

- Historical data; not representative of current conditions.
- Monthly chart values require visual verification.
- Original source must be preserved.
- Indicator definitions and calculation periods should be verified before analytical use.
---

## Source 05: WHO — HeRAMS Gaza Snapshot August 2026

**Organization:** World Health Organization (WHO)

**Report Title:** HeRAMS occupied Palestinian territory: Gaza infographics August 2026

- **Geographic Coverage:** Gaza Strip
- **Domain:** Healthcare
- **Publication Date:** 2026-09-13
- **Snapshot Period:** August 2026
- **Exact Cutoff Date:** Not specified in the report
- **Report Length:** 50 pages
- **Data Type:** Health facility operational status and service availability indicators
- **Validation Status:** Preliminary / Under Verification

**Official Source:**

- [WHO HeRAMS — Gaza Infographics August 2026](https://www.who.int/publications/m/item/herams-opt-gaza-infographics-august-2026)

**Data Collection Notes:**

- Six pages were reviewed and used for the initial healthcare dataset: pages 6, 11, 26, 31, 36, and 41.
- Extracted indicators include total evaluated facilities, functioning, partially functioning, non-functioning, and destroyed facilities.
- Original facility categories and published percentages were preserved.
- Arithmetic consistency checks were performed against the reported facility totals.
- The exact cutoff date was not provided; therefore, `cutoff_date` remains NULL in the dataset.
- The report is preliminary and its data remains under verification and review.
- Published values were preserved without replacing them with calculated estimates.

**Dataset:** `data/staging/health_facility_status.csv`

### Source Scope

The report provides information about health service delivery units, hospitals, health centers, and healthcare service availability in Gaza.

The following pages were reviewed against both the page text and the infographic images.

### Page 6 — All Health Service Delivery Units (HSDUs)

**Indicator: HSDU STATUS**

| Indicator | Published Value |
|---|---:|
| Total HSDUs Evaluated | 209 |
| Functioning | 0 |
| Partially Functioning | 107 |
| Non-Functioning | 43 |
| Destroyed | 59 |
| Published Percentage | 51% |

**Source Statement:** 107 (51%) out of 209 HSDUs evaluated are at least partially functioning.

**Notes:**
- HSDUs include hospitals, field hospitals, government centers, and UNRWA centers.
- Destroyed facilities are reported separately from non-functioning facilities.
- The snapshot does not specify an exact cutoff day.
- The published 51% refers to facilities that are at least partially functioning, not fully functioning.

### Page 11 — All Hospitals

**Indicator: HOSPITAL STATUS**

| Indicator | Published Value |
|---|---:|
| Total Hospitals Evaluated | 35 |
| Functioning | 0 |
| Partially Functioning | 18 |
| Non-Functioning | 10 |
| Destroyed | 7 |
| Published Percentage | 51% |

**Source Statement:** 18 (51%) out of 35 hospitals evaluated are at least partially functioning.

**Notes:**
- Field hospitals are excluded and presented separately.
- The total excludes hospitals reported closed by administrative decision.
- Al-Naser Hospital was reported permanently closed and merged with the existing Al-Naser AlRantisi Hospital.
- Two hospitals are missing coordinates from the map; this does not change the reported total.
- The snapshot does not specify an exact cutoff day.

### Page 26 — All Health Centers

**Indicator: HEALTH CENTER STATUS**

| Indicator | Published Value |
|---|---:|
| Total Health Centers Evaluated | 159 |
| Functioning | 0 |
| Partially Functioning | 78 |
| Non-Functioning | 29 |
| Destroyed | 52 |
| Published Percentage | 49% |

**Source Statement:** 78 (49%) out of 159 health centers evaluated are at least partially functioning.

**Notes:**
- Includes government primary healthcare centers, UNRWA centers, and national NGO health centers.
- The infographic focuses on a limited number of priority services.
- Facilities reported destroyed, non-functioning, or inaccessible are excluded from the Partner Support section.
- The Partner Support reporting section refers to the 78 health centers and should not be confused with the total of 159 evaluated centers.
- The map displays facilities with available coordinates; the number of facilities missing coordinates is not specified.
- The snapshot does not specify an exact cutoff day.

### Page 31 — Government Primary Healthcare Centers

**Indicator: PHC STATUS**

| Indicator | Published Value |
|---|---:|
| Total Government PHCs Evaluated | 56 |
| Functioning | 0 |
| Partially Functioning | 15 |
| Non-Functioning | 18 |
| Destroyed | 23 |
| Published Percentage | 27% |

**Source Statement:** Only 15 (27%) out of 56 government PHCs evaluated are partially functioning.

**Notes:**
- The infographic covers government primary healthcare centers and a limited number of priority primary-care services.
- Facilities reported destroyed, non-functioning, or inaccessible are excluded from the Partner Support section.
- The Partner Support section refers to 15 government PHCs.
- One case is marked as "Not relevant" in building status.
- The access dimension reports "Destroyed / Non-Functioning" as a combined value of 41. This is a separate dimension and must not be mixed with the operational status categories.
- The map displays facilities with coordinates; the number of missing coordinates is not specified.
- The snapshot does not specify an exact cutoff day.

### Page 36 — UNRWA Health Centers

**Indicator: HEALTH CENTER STATUS**

**Infographic Category:** UNRWA Health Centers

| Indicator | Published Value |
|---|---:|
| Total UNRWA Health Centers Evaluated | 26 |
| Fully Functioning | 0 |
| Partially Functioning | 11 |
| Non-Functioning | 8 |
| Destroyed | 7 |
| Published Percentage | 42% |

**Source Statement:** 11 (42%) out of 26 health centers evaluated are at least partially functioning.

**Notes:**
- The original page heading is "HEALTH CENTER STATUS"; the UNRWA category is specified in the infographic subtitle.
- The page uses "Non-functional" for the non-functioning category.
- Facilities reported destroyed, non-functioning, or inaccessible are excluded from the Partner Support section, which refers to 11 health centers.
- Partner Support is displayed as 100% "No support", with the statement "No types of support reported". This is recorded as displayed, without further interpretation.
- The map does not specify how many facilities are missing coordinates.
- The snapshot does not specify an exact cutoff day.

### Page 41 — National NGO Health Centers

**Indicator: NGO HEALTH CENTER STATUS**

**Infographic Category:** Non-governmental organizations (NGOs) health centers

| Indicator | Published Value |
|---|---:|
| Total NGO Health Centers Evaluated | 77 |
| Fully Functioning | 0 |
| Partially Functioning | 52 |
| Non-Functioning | 3 |
| Destroyed | 22 |
| Published Percentage | 68% |

**Source Statement:** 52 (68%) out of 77 health centers evaluated are at least partially functioning.

**Notes:**
- The infographic focuses on a limited number of priority services for NGO health centers.
- Facilities reported destroyed, non-functioning, or inaccessible are excluded from the Partner Support section, which refers to 52 health centers.
- The map displays facilities with available coordinates; the number of facilities missing coordinates is not specified.
- The third reason under Functionality constraints is visibly truncated in the source page: "Lack of financial resources to". The missing text has not been inferred or completed.
- The snapshot does not specify an exact cutoff day.

### Cross-Page Data Quality and Interpretation Rules

1. Preserve the original page number, indicator title, category, and published labels for every extracted value.
2. The report's snapshot period is August 2026. Do not assign an exact observation or cutoff date unless another source explicitly provides one.
3. Publication date and snapshot period must be stored separately.
4. The report is preliminary and its data is subject to verification and review.
5. "Destroyed" must remain separate from "Non-Functioning".
6. "At least partially functioning" must not be interpreted as "fully functioning".
7. The hospital figures on page 11 exclude field hospitals.
8. Page 6 covers all HSDUs, while page 11 covers hospitals and page 26 covers all health centers. These scopes overlap and must not be added together.
9. Government PHCs, UNRWA health centers, and NGO health centers are detailed categories. Do not assume their totals are mutually exclusive or use them to calculate residuals without verifying the report's definitions.
10. Partner Support denominators are not interchangeable with the total number of facilities evaluated.
11. Preserve missing, truncated, or unavailable information as unknown. Do not fill gaps with assumptions.
12. Published percentages must be preserved separately from any percentages independently calculated during validation.

### Extraction Validation

The reported operational status categories were checked against the corresponding evaluated totals:

- Page 6: 0 + 107 + 43 + 59 = 209
- Page 11: 0 + 18 + 10 + 7 = 35
- Page 26: 0 + 78 + 29 + 52 = 159
- Page 31: 0 + 15 + 18 + 23 = 56
- Page 36: 0 + 11 + 8 + 7 = 26
- Page 41: 0 + 52 + 3 + 22 = 77

These checks confirm arithmetic consistency only; they do not independently validate the underlying facility assessments.

**Source Reference:** WHO, *HeRAMS occupied Palestinian territory: Gaza infographics August 2026*, relevant pages 6, 11, 26, 31, 36, and 41.

---