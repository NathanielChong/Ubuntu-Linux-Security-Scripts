#!/bin/bash

Purple='\033[0;35m'
NC='\033[0m'
echo -e "Now we are locking the root account."
passwd -dl root
