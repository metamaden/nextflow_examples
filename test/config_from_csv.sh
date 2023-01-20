#!/usr/bin/env bash

# Write to NextFlow config file from a table (CSV)

while IFS=, read -r field1 field2
do
    echo "$field1 and $field2"
done < ./config/config.csv