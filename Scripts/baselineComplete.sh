#!/bin/bash

## ----------------------------------------------------------------------
## Baseline Completion Tasks
## ----------------------------------------------------------------------
# Flag that Baseline Script has completed.  Deleting the 'BaselineSetupComplete.txt' file will cause Baseline Setup to rerun.
# Define the log file path
log_file="/var/log/BaselineSetupComplete.txt"

# Create the file with the current time
date +"%Y-%m-%d %H:%M:%S" > "$log_file"

# Print success message
echo "SetupComplete.txt created with the current time."