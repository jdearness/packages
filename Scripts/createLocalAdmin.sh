#!/usr/bin/env bash
#set -x

############################################################################################
##
## Script to create Local Admin Account for IT Use
##
###########################################

## Copyright (c) 2020 Microsoft Corp. All rights reserved.
## Scripts are not supported under any Microsoft standard support program or service. The scripts are provided AS IS without warranty of any kind.
## Microsoft disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a
## particular purpose. The entire risk arising out of the use or performance of the scripts and documentation remains with you. In no event shall
## Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever
## (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary
## loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility
## of such damages.
## Feedback: neiljohn@microsoft.com
## Altered by James Dearness, Wyong Christian Community School
##
## Notes
##
## This script creates a new Admin account for temporary IT Admin purposes

# Define variables

adminaccountname="lapsadmin"       # This is the accountname of the new admin
adminaccountfullname="LAPS Admin"  # This is the full name of the new admin user
scriptname="Create Local Admin Account"
logandmetadir="/Library/Logs/createLocalAdminAccount"
log="$logandmetadir/createLocalAdminAccount.log"

# function to delay until the user has finished setup assistant.
waitforSetupAssistant () {
  until [[ -f /var/db/.AppleSetupDone ]]; do
    delay=$(( $RANDOM % 50 + 10 ))
    echo "$(date) |  + Setup Assistant not done, waiting [$delay] seconds"
    sleep $delay
  done
  echo "$(date) | Setup Assistant is done, lets carry on"
}

## Check if the log directory has been created and start logging
if [ -d $logandmetadir ]; then
    ## Already created
    echo "# $(date) | Log directory already exists - $logandmetadir"
else
    ## Creating Metadirectory
    echo "# $(date) | creating log directory - $logandmetadir"
    mkdir -p $logandmetadir
fi


# start logging
exec 1>> $log 2>&1

# Begin Script Body

echo ""
echo "##############################################################"
echo "# $(date) | Starting $scriptname"
echo "############################################################"
echo ""

echo "Creating new local admin account [$adminaccountname]"
#p=`head -c 24 /dev/urandom | base64 | tr -dc 'a-zA-Z0-9'`
waitforSetupAssistant
echo "Adding $adminaccountname to hidden users list"
sudo defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add "$adminaccountname"
sudo sysadminctl -deleteUser "$adminaccountname" # Remove existing admin account if it exists
sudo sysadminctl -adminUser "$adminaccountname" -adminPassword "OUTRAGE-crowd-fellow^6" -addUser "$adminaccountname" -fullName "$adminaccountfullname" -password "OUTRAGE-crowd-fellow^6" -admin