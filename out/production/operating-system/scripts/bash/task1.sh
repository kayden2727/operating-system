#!/bin/bash

FILE="$1"

if [ -z "$FILE" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

if [ -f "$FILE" ]; then
    FILESIZE=$(stat -c%s "$FILE")

    if [ "$FILESIZE" -gt 1048576 ]; then
        echo "File is too large"
    else
        echo "File size is within limits"
    fi
else
    echo "File does not exist"
fi