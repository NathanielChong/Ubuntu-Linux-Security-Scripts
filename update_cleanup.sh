#!/bin/bash
echo "Run of $0" >> scriptlog.txt
#updates all software and clean packages.
apt-get update
apt-get autoclean
apt-get autoremove
