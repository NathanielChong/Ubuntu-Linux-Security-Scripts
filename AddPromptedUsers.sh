#!/bin/bash
echo "Run of $0" >> scriptlog.txt

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
		