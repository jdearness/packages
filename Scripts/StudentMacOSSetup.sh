#!/bin/bash
# This script flags that the Baseline setup has completed.  Deleting this file will cause Baseline Setup to rerun.
# Define the log file path
log_file="$HOME/Library/Logs/BaselineSetupComplete.txt"

# Create the file with the current time
date +"%Y-%m-%d %H:%M:%S" > | sudo tee "$log_file" > /dev/null

# Print success message
echo "SetupComplete.txt created with the current time."