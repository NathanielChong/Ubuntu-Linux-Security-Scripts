#!/bin/bash

Purple='\033[0;35m'
NC='\033[0m'
echo -e "Would you like to add users?"
read addUsersResponse
check(){
if [ $addUsersResponse = "n" ]
then
	echo -e "Lets continue"
elif [ $addUsersResponse = "Y" ]
then
	declare -a goodUsers=(); #List of users to be added.
	declare -x response
	declare -x pass="Ftbll530!" #password all new users are given.
	while [ "$response" != "X" ] #Loop asks user to specify accounts to add.
	do
    		echo -e "Which users do you need?(Type X to exit)?:"
    		read response

		if [ "$response" != "X" ]
		then
			goodUsers+=("$response")
		fi
	done

	echo -e "The users added:"
	for u in "${goodUsers[@]}"
	do
 	   useradd $u
	   echo -e $u
	done
		
else
	echo -e "Please type 'Y' or 'n':"
	read addUserResponse
	check
fi
}
check
