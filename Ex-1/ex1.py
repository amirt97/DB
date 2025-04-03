import csv
from io import TextIOWrapper
from zipfile import ZipFile

# In-memory sets/dicts to collect unique data
regions = set()
incomegroups = set()
countries = dict()
universities = dict()
enrollments = []

def process_file():
    with ZipFile('enrollment.zip') as zf:
        with zf.open('enrollment.csv', 'r') as infile:
            reader = csv.DictReader(TextIOWrapper(infile, 'utf-8'))

            last_rows = {}

            for row in reader:
                iau_id = row["iau_id1"]
                year = row["year"]

                # Add to Region and Incomegroup
                regions.add(row["region"])
                incomegroups.add(row["incomegroup"])

                # Add to Country
                countries[row["countrycode"]] = (
                    row["country"], row["region"], row["incomegroup"]
                )

                # Always override latest row per university
                last_rows[iau_id] = row

                # Collect enrollment data
                enrollments.append((iau_id, year, row["students5_estimated"]))

            # Write Region.csv
            with open("Region.csv", 'w', encoding='utf-8', newline='') as f:
                writer = csv.writer(f)
                writer.writerow(["region"])
                for r in sorted(regions):
                    writer.writerow([r])

            # Write Incomegroup.csv
            with open("Incomegroup.csv", 'w', encoding='utf-8', newline='') as f:
                writer = csv.writer(f)
                writer.writerow(["incomegroup"])
                for i in sorted(incomegroups):
                    writer.writerow([i])

            # Write Country.csv
            with open("Country.csv", 'w', encoding='utf-8', newline='') as f:
                writer = csv.writer(f)
                writer.writerow(["countrycode", "country", "region", "incomegroup"])
                for code, (name, region, income) in countries.items():
                    writer.writerow([code, name, region, income])

            # Write University.csv
            with open("University.csv", 'w', encoding='utf-8', newline='') as f:
                writer = csv.writer(f)
                writer.writerow([
                    "iau_id1", "eng_name", "orig_name", "foundedyr", "yrclosed",
                    "private01", "latitude", "longitude", "phd_granting",
                    "divisions", "specialized", "year", "countrycode"
                ])
                for u in last_rows.values():
                    writer.writerow([
                        u["iau_id1"], u["eng_name"], u["orig_name"], u["foundedyr"], u["yrclosed"],
                        u["private01"], u["latitude"], u["longitude"], u["phd_granting"],
                        u["divisions"], u["specialized"], u["year"], u["countrycode"]
                    ])

            # Write EnrollmentData.csv
            with open("EnrollmentData.csv", 'w', encoding='utf-8', newline='') as f:
                writer = csv.writer(f)
                writer.writerow(["iau_id1", "year", "students5_estimated"])
                seen = set()
                for iau_id, year, est in enrollments:
                    key = (iau_id, year)
                    if key not in seen:
                        seen.add(key)
                        writer.writerow([iau_id, year, est])

def get_names():
    return ["Region", "Incomegroup", "Country", "University", "EnrollmentData"]

if __name__ == "__main__":
    process_file()
