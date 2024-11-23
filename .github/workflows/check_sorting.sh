#!/usr/bin/env bash

file="test_file.toml"
exit_code=0

IFS=";"

# shellcheck disable=SC2207
# This just feels like the easiest to understand. I don't know how to split the
# file on multiple newlines any better way.
# Ref: https://stackoverflow.com/a/62608718/2274551
sections=($(awk -v RS= -v ORS=";" '{print}' "$file"))

for section in "${sections[@]}"; do
    header=$(echo "$section" | head -n 1)       # Extract header
    rows=$(echo "$section" | tail -n +2)       # Extract rows
    sorted=$(echo "$rows" | sort)              # Sort rows

    if [ "$rows" != "$sorted" ]; then          # Compare rows with sorted
        invalid_sections+=("$header")          # Add header to invalid list
        exit_code=1
    fi
done

if [ $exit_code -ne 0 ]; then
    echo "Thanks for adding new resources to this project!"
    echo ""
    echo "To help with consistency and easie maintenance, e.g. spot duplicates "
    echo "the items in each section is sorted alphanumerically"
    echo ""
    echo "Your change doesn't conform to this so please ensure the section(s) "
    echo "you've edited are sorted!"
    echo ""
    echo "These sections are currently not sorted"

    for s in "${invalid_sections[@]}"; do
        echo " - \\\`$s\\\`"
    done
fi

exit $exit_code
