#!/bin/bash
echo "Run of $0" >> scriptlog.txt
declare -a fileList=('.mp3' '.mp4' '.jpeg' '.png' '.gif' '.wmv' '.bmp' '.gam' '.jpg' '.ogg'
    '.mov' '.aac' '.swf' '.mpeg' '.flv' '.jsp' '.js' '.wav' '.wma');
declare -a malwareList=('hack' 'john' 'oph' 'rainbow' 'backdoor' 'rip' 'trojan' 
	'crack' 'nc' 'cat' 'net' 'hydra' 'medusa'); 
# Creates two lists for potential unwanted fies.

for f in "${fileList[@]}"
do
	find / -name *"$f" >> /media/fishy
done #This loop finds and logs media 

for m in "${malwareList[@]}"
do
	find /-name *"$m" >> /media/mware
done #This loop finds and logs malware.

sed -i '/\/usr\/share\/.*/d' /media/fishy
sed -i '/\/usr\/lib\/.*/d' /media/fishy

