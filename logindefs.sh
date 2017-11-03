#!/bin/bash
sed -i 's/^PASS_WARN_AGE/PASS_WARN_AGE 8/g' /etc/login.defs
sed -i '/^PASS_MAX_DAYS/s/99999/21/g' /etc/login.defs
sed -i '/^PASS_MIN_DAYS/s/0/7/g' /etc/login.defs
