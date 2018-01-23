#!/bin/bash
echo "Run of $0" >> scriptlog.txt

	awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd > users.txt

	mapfile -t userArray < users.txt

	for i in "${userArray[@]}"
	do
		echo -e "Ftbll530!\nFtbll530!" | passwd "$i"
	done
    	echo -e "All passwords set!"
