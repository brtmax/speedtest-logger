#!/bin/bash

# Set the path to the log file
tmp_log_file="/speedtest_logger/logs/tmp_speedtest.log"
log_file="/speedtest_logger/logs/speedtest.log"

# Get the current date and time
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Run speedtest and log the results with timestamps to the timestamped log file
echo "$timestamp" >> "$log_file"
speedtest-cli --simple >> "$log_file"

speedtest-cli --simple >> "$tmp_log_file"
