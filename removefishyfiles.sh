#!/bin/bash
echo -e "Did you answer forensics first? This script will delete
media files Y/n"

read response
if [$response == "n" ]
then
	echo -e "Please answer forensics first"
	exit 1 
done

declare -a fileList=('.mp3' '.mp4' '.jpeg' '.png' '.gif' '.wmv' '.bmp' '.gam' '.jpg' '.ogg' '.m4b'
    '.mov' '.aac' '.swf' '.mpeg' '.flv' '.jsp' '.js' '.wav' '.wma');
declare -a malwareList=('hack' 'john' 'oph' 'rainbow' 'backdoor' 'rip' 'trojan' 'crack' 'nc' 'cat' 'net'); 
# Creates two lists for potential unwanted fies.

for f in "${fileList[@]}"
do
	find / -name *"$f" >> /media/fishy
done #This loop finds and logs media 

for m in "${malwareList[@]}"
do
	find /-name *"$m" >> /media/mware
done #This loop finds and logs malware.

while read media; do
  rm "$media"
done < /media/fishy