#!/bin/bash
sed -i '/^PermitEmptyPasswords/s/yes/no/g' /etc/ssh/sshd_config  #EmptyPasswords
sed -i '/^PermitRootLogin/s/without-password/no/g' /etc/ssh/sshd_config
sed -i '/^PermitRootLogin/s/yes/no/g' /etc/ssh/sshd_config
