#!/bin/bash
#Version 4 Script Nathan Chong 

#Preliminary removing services, with user input.
./removeWithInput.sh

#Known vulnerabilities
./RmKnownProblems.sh

#Below script deletes users, with user input.
./RmPromptedUsers.sh


#Below script Adds New Users, with user input.
./AddPromptedUsers.sh


#finding prohibited files, and logging them.
./findfishyfiles.sh


#firewall settings
./firewall.sh


#file permissions (chmod)
./chmodperms.sh


#lightdm configuration (disable guest)
./disableguest.sh


#Locks Root Account login
./lock_rootaccount.sh


#upgrades etc.
./upgrades.sh &


#SSH Permissions
./sshperms.sh


#Run rootkit hunter and debsums
./rootkit_debsums.sh &

#Update processes, and clean up residual files.
./update_cleanup.sh

#Auto update.
./autoupdate.sh

#securepasswords
./securepassword.sh

#sudoers timeout
./sudoerstimeout.sh




