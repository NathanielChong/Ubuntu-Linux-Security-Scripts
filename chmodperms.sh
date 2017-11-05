#!/bin/bash
echo "Run of $0" >> scriptlog.txt
#file permissions
chmod 640 /etc/shadow
chmod 440 /etc/sudors
chmod 640 /etc/ftpusers
chmod 440 /etc/inetd.conf
chmod 440 /etc/xinetd.conf                                                           
chmod 644 /etc/hosts.allow
chmod 644 /etc/hosts.deny
chmod 600 /etc/cron.allow
chmod 600 /etc/cron.deny
chmod 644 /etc/crontab
chmod 644 /var/log/wtmp
chmod 644 /var/run/utmp 
chmod 440 /etc/inet.d