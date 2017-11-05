#!/bin/bash
echo "Run of $0" >> scriptlog.txt
echo -e "Now we are locking the root account."
passwd -dl root
