#!/bin/bash
# Hide account from Users list
dscl . create /Users/lapsadmin IsHidden 1
# Hide home directory from GUI
chflags hidden /Users/lapsadmin
