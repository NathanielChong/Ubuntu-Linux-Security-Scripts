#!/bin/bash

echo -e "Would you like to delete users?"
read deleteUsersResponse
check(){
if [ $deleteUsersResponse = "n" ]
then
	echo -e "Lets continue"
elif [ $deleteUsersResponse = "Y" ]
then
    	declare -a badUsers #List of bad users.
	declare -x response
	mapfile -t userArray < users.txt
	echo -e "Here are your users:"
	for i in "${userArray[@]}"
	do
		echo "$i"
	done

	while [ "$response" != "X" ] #Loop asks user to specify accounts to remove.
	do
    		echo -e "Which users do you not need?(Type X to exit)?:"
    		read response

		if [ "$response" != "X" ]
		then
			badUsers+=("$response")
		fi
	done
	
	echo -e "The users deleted:"
	for u in "${badUsers[@]}" 
	do
    		userdel --force $u
		echo $u >> "Deleted Users.txt"
		echo -e $u
	done

else
	echo -e "Please type 'Y' or 'n':"
	read deleteUserResponse
	check
fi
}
check
