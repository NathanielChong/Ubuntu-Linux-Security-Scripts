#!/bin/bash
echo "Run of $0" >> scriptlog.txt
echo -e "Would you like to set passwords to all users?"
read userPasswordResponse
check(){
if [ $userPasswordResponse = "n" ]
then
	echo -e "Let's continue"
elif [ $userPasswordResponse = "Y" ]
then
	awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd > users.txt

	mapfile -t userArray < users.txt

	for i in "${userArray[@]}"
	do
		echo -e "Ftbll530!\nFtbll530!" | passwd "$i"
	done
    	echo -e "All passwords set!"
else
	echo -e "Please type 'Y' or 'n':"
	echo $userPasswordResponse
	read userPasswordResponse
	check
fi
}
check

