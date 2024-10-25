#!/bin/bash
# This script flags that the Baseline setup has completed.  Deleting this fuile will cause Baseline Setup to rerun.
# Define the log file path
log_file="$HOME/Library/Logs/BaselineSetupComplete.txt"

# Create the file with the current time
date +"%Y-%m-%d %H:%M:%S" > "$log_file"

# Print success message
echo "SetupComplete.txt created with the current time."