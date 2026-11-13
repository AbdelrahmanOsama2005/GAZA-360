
import pandas as pd
import pyodbc
from pathlib import Path

# 1. Define project paths
project_root = Path(__file__).resolve().parents[2]

csv_path = project_root / "data" / "staging" / "health_facility_status.csv"

# 2. SQL Server connection settings
connection_string = (
    "DRIVER={ODBC Driver 18 for SQL Server};"
    "SERVER=DESKTOP-NEILHJN;"
    "DATABASE=GAZA_360_DB;"
    "Trusted_Connection=yes;"
    "TrustServerCertificate=yes;"
)

# 3. Load staging CSV
df = pd.read_csv(csv_path)

print("CSV loaded successfully.")
print("Records:", len(df))

# 4. Connect to SQL Server
connection = pyodbc.connect(connection_string)
cursor = connection.cursor()

print("SQL Server connection successful.")

# 5. Check Bronze table
cursor.execute("""
IF OBJECT_ID('bronze.health_facility_status', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.health_facility_status (
        record_id INT NOT NULL PRIMARY KEY,
        source_name NVARCHAR(100),
        report_title NVARCHAR(300),
        snapshot_period NVARCHAR(100),
        publication_date NVARCHAR(20),
        page_number INT,
        facility_category NVARCHAR(150),
        total_evaluated INT,
        functioning INT,
        partially_functioning INT,
        non_functioning INT,
        destroyed INT,
        published_percentage INT,
        percentage_description NVARCHAR(200),
        geographic_scope NVARCHAR(100),
        cutoff_date NVARCHAR(20),
        data_status NVARCHAR(100),
        notes NVARCHAR(MAX)
    );
END
""")

connection.commit()


print("Bronze table is ready.")

# 6. Insert staging records into Bronze

insert_query = """
INSERT INTO bronze.health_facility_status (
    record_id,
    source_name,
    report_title,
    snapshot_period,
    publication_date,
    page_number,
    facility_category,
    total_evaluated,
    functioning,
    partially_functioning,
    non_functioning,
    destroyed,
    published_percentage,
    percentage_description,
    geographic_scope,
    cutoff_date,
    data_status,
    notes
)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
"""

# Prevent duplicate inserts
cursor.execute("""
SELECT COUNT(*)
FROM bronze.health_facility_status
""")

existing_records = cursor.fetchone()[0]

if existing_records == 0:
    for row in df.itertuples(index=False, name=None):
        cursor.execute(insert_query, tuple(
            None if pd.isna(value) else value
            for value in row
        ))

    connection.commit()
    print(f"Successfully loaded {len(df)} records into Bronze.")

else:
    print(
        f"Bronze already contains {existing_records} records. "
        "No new records were inserted."
    )
    cursor.close()
    connection.close()