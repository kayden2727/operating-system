#!/bin/bash

for file in *.txt; do
    if [[ "$file" != OLD_* ]]; then
        mv "$file" "OLD_$file"
    fi
done