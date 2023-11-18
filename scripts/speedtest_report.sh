#!/bin/bash

# Set the path to the log file
log_file="/speedtest_logger/logs/tmp_speedtest.log"

# Calculate the average download and upload speeds from the log file
average_download=$(awk '/Download:/{sum+=$2; count++}END{if(count>0) printf "%.2f", sum/count}' "$log_file")
average_upload=$(awk '/Upload:/{sum+=$2; count++}END{if(count>0) printf "%.2f", sum/count}' "$log_file")

# Send an email with the average speeds
echo "Average Download: $average_download Mbps" > /tmp/speedtest_report.txt
echo "Average Upload: $average_upload Mbps" >> /tmp/speedtest_report.txt

mail -s "Weekly Speedtest Report" maxbretschneider@mailbox.org < /tmp/speedtest_report.txt
mail -s "Weekly Speedtest Report" thuydungnghiem@ymail.com < /tmp/speedtest_report.txt
# Clear the log file
> "$tmp_log_file"

