#!/bin/bash
echo "Run of $0" >> scriptlog.txt
#finding rootkits
apt-get install rkhunter -y --force-yes
rkhunter -c --sk
#The log file is /var/log/rkhunter.log

#cracklib password policy
apt-get install libpam-cracklib -y --force-yes

#debsums
apt-get install debsums -y --force-yes
debsums
debsums –a –s

#check rootkit
apt-get install chkrootkit -y --force-yes
chkrootkit
#The log is located in dir /var/log/chkrootkit/

#Install bum and gufw tools.
apt-get install bum -y --force-yes
apt-get install gufw -y --force-yes
gufw

#Clam Anti Virus
apt-get install clamav
freshclam #update virus definitions.
clamscan -r --bell -i / #Scans all files only display infected.
