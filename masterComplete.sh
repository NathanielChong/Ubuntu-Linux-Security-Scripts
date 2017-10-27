#!/bin/bash

Purple='\033[0;35m'
NC='\033[0m'
echo -e "Welcome to the MASTER.sh Script\nSimply type 'Y' or 'n' to every prompted answer!\nContinue?"
read response
check(){
if [ $response = "n" ]
then
	echo "Good Luck"
    	exit
elif [ $response = "Y" ]
then
    	echo "Great! Let's move on."
else
	echo "Please type 'Y' or 'n':"
	read response
	check
fi
}
check

./firewall.sh

./AddPromptedUsers.sh

./securepassword.sh

./RmPromptedUsers.sh

./RemoveWithInput.sh

./lock_rootaccount.sh

./disableguest.sh

./RmKnownProblems.sh

echo "YAAAAAAAAAAAAAAAYYYYYY WE DONE"
sl
