#!/bin/bash
echo "Run of $0" >> scriptlog.txt
	declare -a removeList=(); #List of things to be removed
	declare -a vulnList=('ftp' 'vsftpd' 'bind9' 'smba' 'samba' 'sambashare' 'smbashare' 'apache' 'dnsmasq' 'bind9' 'apache' 'postgresql' 'apache2' 'openssh-server' 'openssh-client' 'open-ssh'); #List of services

	for x in "${vulnList[@]}" 
	do
		echo -e "Do you need $x?" #Prompt if the service is needed.
		read response
		if [ $response = "n" ]
		then
    			removeList+=("$x") #Add service to be removeList.
		fi
	done

	for z in "${removeList[@]}" #Purge everything in the removeList.
	do
		apt-get purge $z -y --force-yes 
	done

apt-get autoremove -y --force-yes #Clean up residual files.

'''rm -r /etc/postgresql/
rm -r /etc/postgresql-common/
rm -r /var/lib/postgresql/
userdel -r postgres
groupdel postgres
'''



