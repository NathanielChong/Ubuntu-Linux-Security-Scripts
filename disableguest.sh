#!/bin/bash
echo "Run of $0" >> scriptlog.txt
echo -e "Now let's disable guest."
echo allow-guest=false >> /etc/lightdm/lightdm.conf
echo -e "Guest Disabled!"
