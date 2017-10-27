#!/bin/bash

Purple='\033[0;35m'
NC='\033[0m'
echo -e "Now let's disable guest."
echo allow-guest=false >> /etc/lightdm/lightdm.conf
echo -e "Guest Disabled!"
