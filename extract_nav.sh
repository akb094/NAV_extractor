#!/bin/bash

OUTPUT_FILE="nav_data.tsv"

# Download the file
curl -s https://www.amfiindia.com/spages/NAVAll.txt -o NAVAll.txt

# Checking if file is downloaded and not empty
if [ ! -s NAVAll.txt ]; then
    echo "Failed to download NAV data or file is empty."
    exit 1
fi

# Extract data: skip first line (header), ignore blank lines, and keep only lines with 6+ semicolon-separated fields
awk -F ';' '
BEGIN {
    OFS = "\t";
    print "Scheme Name", "Asset Value";
}
# Match only rows with 6 fields and non-empty scheme name and numeric NAV
NF >= 6 && $4 != "" && $5 ~ /^[0-9.]+$/ {
    print $4, $5;
}' NAVAll.txt > "$OUTPUT_FILE"

echo "Extracted $(($(wc -l < "$OUTPUT_FILE") - 1)) entries to $OUTPUT_FILE"
