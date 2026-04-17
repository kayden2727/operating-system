#!/bin/bash

LOGFILE="server.log"
KEYWORD="Error"

if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file not found."
    exit 1
fi


COUNT=$(grep -c "$KEYWORD" "$LOGFILE")

echo "Number of lines containing Error: $COUNT"
