# GAZA 360
## Humanitarian Data Intelligence Platform

**GAZA 360** is an end-to-end Data Engineering, Analytics, and Business Intelligence project designed to transform humanitarian datasets related to Gaza into structured, documented, and interactive insights.

The platform brings together data collection, cleaning, transformation, SQL data modeling, data quality checks, and Power BI dashboards.

**Project Status:** 🚧 In Progress

---

## 🎯 Project Objectives

- Analyze humanitarian impact indicators over time.
- Explore demographic distributions in available datasets.
- Monitor healthcare facility status.
- Organize data into analytical models.
- Build interactive dashboards for data exploration.
- Document data sources, transformations, and limitations.

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Python | Data collection and transformation |
| Pandas | Data cleaning and manipulation |
| SQL Server 2022 | Data storage and analytical modeling |
| SQL | Data transformation and quality checks |
| Power BI | Interactive dashboards and reporting |
| DAX | Analytical measures and KPIs |
| Git & GitHub | Version control and project management |

---

## 🏗️ Data Architecture

The project follows a layered data architecture:

```text
Data Sources
     |
     v
    RAW
     |
     v
  STAGING
     |
     v
Cleaning & Transformation
     |
     v
    GOLD
     |
     v
  Power BI
     |
     v
Interactive Dashboards
```

The Gold layer contains fact and dimension tables designed for analytical reporting.

The data model uses a Fact Constellation (Galaxy Schema), where multiple fact tables share common dimensions.

---

## 📊 Implemented Components

### 1. Data Engineering
- Python-based data collection.
- CSV processing and transformation.
- Structured data organization.
- SQL analytical data model.
- Data quality audit checks.

### 2. SQL Data Model

Implemented analytical tables include:

**Fact Tables**
- `fact_daily_casualties`
- `fact_identified_deaths`
- `fact_population`

**Dimension Tables**
- `dim_date`
- `dim_age`
- `dim_sex`
- `dim_update_batch`

### 3. Power BI Dashboards

The project includes four dashboard pages:

1. **Executive Overview** – High-level humanitarian indicators.
2. **Temporal Analysis** – Daily and monthly trends.
3. **Demographic Analysis** – Age and sex distributions.
4. **Data & Methodology** – Sources, data quality, and limitations.

---

## 📂 Repository Structure

```text
GAZA-360/
│
├── data/
│   ├── raw/
│   ├── staging/
│   └── processed/
│
├── python/
│   ├── data_collection/
│   └── cleaning/
│
├── sql/
│
├── power_bi/
│
├── notebooks/
│
├── documentation/
│   ├── data_dictionary.md
│   ├── data_sources.md
│   ├── data_source_inventory.md
│   ├── data_transformation_rules.md
│   └── sql_data_quality_report.md
│
├── .gitignore
├── README.md
└── requirements.txt
```

---

## 🔍 Data Quality & Methodology

The project emphasizes transparent and documented data handling:

- Document original data sources.
- Preserve distinctions between different datasets.
- Apply documented cleaning and transformation rules.
- Perform technical data quality checks.
- Distinguish reported figures from estimates.
- Document assumptions and analytical limitations.
- Avoid interpreting missing values as zero.

**Important:** Technical validation does not necessarily mean independent verification of the original reported figures.

---

## 🚀 Development Roadmap

- [x] Project structure setup
- [x] Python environment setup
- [x] Data collection and cleaning scripts
- [x] Data source documentation
- [x] SQL Gold analytical model
- [x] Data quality audit
- [x] Four Power BI dashboard pages
- [x] Git and GitHub setup
- [ ] Add SQL scripts to repository
- [ ] Add Power BI project file and dashboard screenshots
- [ ] Complete end-to-end pipeline documentation
- [ ] Final portfolio presentation

---

## 📚 Documentation

Detailed project documentation is available in the `documentation/` directory, including:

- Data Sources
- Data Source Inventory
- Data Dictionary
- Data Transformation Rules
- SQL Data Quality Report

---

## 👨‍💻 Project Focus

**Data Engineering | Data Analytics | SQL Server | Python | Power BI | Business Intelligence**

Developed as a practical portfolio project demonstrating data pipeline development, analytical data modeling, and business intelligence reporting.

---

*Turning humanitarian data into structured insights.*