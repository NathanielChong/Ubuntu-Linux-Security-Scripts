#!/bin/bash
echo "Run of $0" >> scriptlog.txt

################################################
# SCRIPT STARTS TO RUN BELOW, SUBSCRIPTS ARE   #
# CALLED.                                      #
################################################

#Getting ready to run scripts.
apt-get autoclean
apt-get autoremove 


#Preliminary removing services, with user input.
./removeWithInput.sh

#Known vulnerabilities
./RmKnownProblems.sh

#Below script deletes users, with user input.
./RmPromptedUsers.sh


#Below script Adds New Users, with user input.
./AddPromptedUsers.sh

#Runs all third party securing software.
./thirdpartysecure.sh

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
./upgrades.sh 


#SSH Permissions
./sshperms.sh

#Login Defs
./logindefs.sh

#Auto update.
./autoupdate.sh

#securepasswords
./securepassword.sh

#sudoers timeout
./sudoerstimeout.sh

#Update processes, and clean up residual files.
./update_cleanup.sh






