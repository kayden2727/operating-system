#!/bin/bash

DATE_TIME=$(date '+%Y-%m-%d %H:%M:%S')

HOSTNAME=$(hostname)

CURRENT_USER=$(whoami)

DISK_INFO=$(df -h / | awk 'NR==2 {print $4 " free / " $2 " total"}')

echo "Date & Time : $DATE_TIME"
echo "Hostname : $HOSTNAME"
echo "User : $CURRENT_USER"
echo "Disk (/) : $DISK_INFO"
