#!/bin/bash

if [ ! -d "files" ]; then
    echo "The 'files' directory does not exist."
    exit 1
fi

for file in files/*; do
    if [ -f "$file" ]; then
        first_letter=$(basename "$file" | cut -c 1 | tr '[:upper:]' '[:lower:]')
        
        if [ -d "$first_letter" ]; then
            mv "$file" "$first_letter/"
        else
            echo "Warning: Folder '$first_letter' does not exist. Skipping file '$file'."
        fi
    fi
done

echo "Files have been successfully arranged."