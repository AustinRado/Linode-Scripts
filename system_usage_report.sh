#!/bin/bash

# Create a timestamp
timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

# Define output log file
log_file="system_usage_report_$timestamp.log"

# Get RAM usage
echo "===== RAM USAGE =====" >> "$log_file"
free -h >> "$log_file"
echo "" >> "$log_file"

# Get Disk usage
echo "===== DISK USAGE =====" >> "$log_file"
df -h >> "$log_file"
echo "" >> "$log_file"

# Confirmation
echo "System usage report saved to $log_file"

