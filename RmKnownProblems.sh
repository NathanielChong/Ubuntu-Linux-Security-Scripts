#!/bin/bash
echo "Run of $0" >> scriptlog.txt

declare -a vulnList=('netcat' 'nc' 'telnet' 'telnetd inetulis-telnethd telnetd-ssl' 'john' 'johntheripper' 'rshd' 'rwhod' 'wu-ftpd' 'wu-ftp' 'sendmail' 'rpc' 'lpd' 'nfs' 'nfsd' 'lockd' 'mountd' 'statd' 'portmapper' 'vsftpd' 'aircrack-ng' 
	'hydra' 'medusa' 'ophcrack' 'rainbowcrack' 'minetest'); 
    	#List of known vulnerabilities.


	for v in "${vulnList[@]}"
	do
		apt-get purge $v -y --force-yes
	done

	echo -e "Done! Time to remove leftover files from these."

	apt-get autoremove -y --force-yes #Autoremove residual files.


