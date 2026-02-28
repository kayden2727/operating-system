#!/bin/bash

echo "Top 5 Memory Processes:"

ps -eo pid,rss,comm --sort=-rss | head -n 6 | awk 'NR==1 {print "PID\tMemory(KB)\tProcess"} NR>1 {print $1 "\t" $2 "\t" $3}'
