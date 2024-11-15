#!/bin/bash
# Hide account from Users list
dscl . create /Users/localadmin IsHidden 1
# Hide home directory from GUI
chflags hidden /Users/localadmin
fi