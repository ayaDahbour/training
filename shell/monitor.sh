#!/bin/bash

# Define log file location
logFile="/home/yourusername/monitor.log"

# Get the current date and time
date=$(date '+%Y-%m-%d %H:%M:%S')

# Get CPU and memory usage using vmstat
VMSTAT=$(vmstat 1 2 | tail -1)

# Extract CPU and memory usage from vmstat output
CPU_IDLE=$(echo $VMSTAT | awk '{print $15}')
CPU_USAGE=$((100 - CPU_IDLE))
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

# Log the date, CPU, and memory usage
echo "$date - CPU Usage: $CPU_USAGE% - Memory Usage: $MEMORY_USAGE%" >> $logFile
