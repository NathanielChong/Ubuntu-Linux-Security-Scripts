#!/bin/bash
#finding rootkits
apt-get install rkhunter -y --force-yes
rkhunter -c --sk
apt-get install libpam-cracklib -y --force-yes
apt-get install debsums -y --force-yes
debsums
debsums –a –s
apt-get install chkrootkit -y --force-yes
chkrootkit