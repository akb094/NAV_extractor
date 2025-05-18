# NAV_extractor
test repo for internship assignment

This is a simple shell script that helps you fetch and extract mutual fund data (like Scheme Name and Net Asset Value) from the official AMFI India website.

What does this script do?

    It downloads the latest mutual fund data from AMFI's public page.

    It filters out the extra information and keeps only the Scheme Name and NAV (Net Asset Value).

    It saves the final result into a simple file called nav_data.tsv.

Requirements

This script uses basic command-line tools:

    curl – to download the data

    awk – to process and extract information

Most Linux/macOS systems already have these installed by default.

