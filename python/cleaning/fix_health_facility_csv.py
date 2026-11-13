
import pandas as pd
from pathlib import Path

columns = [
    "record_id", "source_name", "report_title", "snapshot_period",
    "publication_date", "page_number", "facility_category",
    "total_evaluated", "functioning", "partially_functioning",
    "non_functioning", "destroyed", "published_percentage",
    "percentage_description", "geographic_scope", "cutoff_date",
    "data_status", "notes"
]

rows = [
    [1, "WHO HeRAMS", "HeRAMS Gaza Infographics August 2026", "August 2026", "2026-09-13", 6, "All HSDUs", 209, 0, 107, 43, 59, 51, "At least partially functioning", "Gaza Strip", None, "Preliminary / Under Verification", "Includes hospitals, field hospitals, government centers and UNRWA centers."],
    [2, "WHO HeRAMS", "HeRAMS Gaza Infographics August 2026", "August 2026", "2026-09-13", 11, "All Hospitals", 35, 0, 18, 10, 7, 51, "At least partially functioning", "Gaza Strip", None, "Preliminary / Under Verification", "Excludes field hospitals. Total excludes hospitals reported closed by administrative decision. Two hospitals are missing map coordinates."],
    [3, "WHO HeRAMS", "HeRAMS Gaza Infographics August 2026", "August 2026", "2026-09-13", 26, "All Health Centers", 159, 0, 78, 29, 52, 49, "At least partially functioning", "Gaza Strip", None, "Preliminary / Under Verification", "Includes government PHCs, UNRWA centers and national NGO health centers. Facilities reported destroyed, non-functioning or inaccessible are excluded from Partner Support reporting."],
    [4, "WHO HeRAMS", "HeRAMS Gaza Infographics August 2026", "August 2026", "2026-09-13", 31, "Government PHCs", 56, 0, 15, 18, 23, 27, "Partially functioning", "Gaza Strip", None, "Preliminary / Under Verification", "One case marked Not relevant in building status. Access dimension reports Destroyed / Non-Functioning as a separate combined value of 41."],
    [5, "WHO HeRAMS", "HeRAMS Gaza Infographics August 2026", "August 2026", "2026-09-13", 36, "UNRWA Health Centers", 26, 0, 11, 8, 7, 42, "At least partially functioning", "Gaza Strip", None, "Preliminary / Under Verification", "Original page heading is HEALTH CENTER STATUS. Partner Support displays 100% No support. Number of facilities missing map coordinates is unspecified."],
    [6, "WHO HeRAMS", "HeRAMS Gaza Infographics August 2026", "August 2026", "2026-09-13", 41, "NGO Health Centers", 77, 0, 52, 3, 22, 68, "At least partially functioning", "Gaza Strip", None, "Preliminary / Under Verification", "Third functionality constraint is truncated in the source: Lack of financial resources to. Number of facilities missing map coordinates is unspecified."]
]

df = pd.DataFrame(rows, columns=columns)

output_path = Path("data/staging/health_facility_status.csv")
df.to_csv(output_path, index=False, encoding="utf-8-sig")

print("CSV file rebuilt successfully.")
print("Shape:", df.shape)
print(df[["record_id", "facility_category", "total_evaluated"]].to_string(index=False))
