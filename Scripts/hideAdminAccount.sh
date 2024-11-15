#!/bin/bash
# Hide account from Users list
dscl . create /Users/localadmin IsHidden 1
# Hide home directory
chflags hidden /Users/localadmin
# Remove public folders
dscl 
delete Local/Defaults/SharePoints/localadmin\ Public\ Folder/
exit


