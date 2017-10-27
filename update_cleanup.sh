#!/bin/bash
#Install bum and gufw tools.
apt-get install bum -y --force-yes
apt-get install gufw -y --force-yes
gufw
bum

#cupdate and clean packages.
apt-get update
apt-get upgrade
apt-get autoclean
apt-get autoremove
