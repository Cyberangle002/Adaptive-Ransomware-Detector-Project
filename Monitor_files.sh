#!/bin/bash
# Directory to monitor
MONITOR_DIR="/path/to/monitor"

# Log file
LOG_FILE="ransomware_log.txt"

echo "Monitoring $MONITOR_DIR for changes..."

# Real-time monitoring
inotifywait -m -r -e modify,create,delete --format '%w%f %e' $MONITOR_DIR | while read file event; do
    echo "$(date): $event detected on $file" >> $LOG_FILE

    if [[ "$file" == *.encrypted ]]; then
        echo "$(date): Ransomware detected at $file. Taking action!" >> $LOG_FILE
        # Example: Kill a process
        echo "Simulating process isolation..."
    fi
done


