
import pandas as pd
from pathlib import Path

# 1. Define file paths
input_path = Path("data/staging/health_facility_status.csv")
output_path = Path("data/processed/health_facility_status_processed.csv")

# 2. Load staging data
df = pd.read_csv(input_path)

print("Original dataset loaded successfully.")
print("Original shape:", df.shape)

# 3. Standardize column names
df.columns = df.columns.str.strip()

# 4. Clean text columns
text_columns = df.select_dtypes(include=["str", "object"]).columns

for column in text_columns:
    df[column] = df[column].str.strip()

# 5. Convert date columns
df["publication_date"] = pd.to_datetime(
    df["publication_date"],
    format="%Y-%m-%d",
    errors="raise"
)

df["cutoff_date"] = pd.to_datetime(
    df["cutoff_date"],
    errors="coerce"
)

# 6. Validate record IDs
assert df["record_id"].is_unique, "Duplicate record IDs found!"

# 7. Validate facility counts
count_columns = [
    "total_evaluated",
    "functioning",
    "partially_functioning",
    "non_functioning",
    "destroyed"
]

assert (df[count_columns] >= 0).all().all(), "Negative values found!"

# 8. Validate arithmetic consistency
calculated_total = df[
    ["functioning", "partially_functioning",
     "non_functioning", "destroyed"]
].sum(axis=1)

assert (calculated_total == df["total_evaluated"]).all(), \
    "Facility totals are inconsistent!"

# 9. Save processed dataset
output_path.parent.mkdir(parents=True, exist_ok=True)

df.to_csv(output_path, index=False, encoding="utf-8-sig")

print("\nTransformation completed successfully!")
print("Processed shape:", df.shape)
print("Output file:", output_path)
print("\nFinal data types:")
print(df.dtypes.to_string())
