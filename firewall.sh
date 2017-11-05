#!/bin/bash
echo "Run of $0" >> scriptlog.txt
echo -e "Would you like to enable firewall?"
read fireWallResponse
check(){
if [ $fireWallResponse = "n" ]
then
	echo -e "Good Luck"
    	exit
elif [ $fireWallResponse = "Y" ]
then
	ufw enable #enable firewall
	ufw deny incoming
	ufw allow outgoing
	ufw logging on high #logging.
    	echo -e "Firewall active!"
else
	echo -e "Please type 'Y' or 'n':"
	read fireWallResponse
	check
fi
}
check

