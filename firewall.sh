#!/bin/bash
echo "Run of $0" >> scriptlog.txt
ufw enable #enable firewall
ufw deny incoming
ufw allow outgoing
ufw logging on high #logging.
echo -e "Firewall active!"
