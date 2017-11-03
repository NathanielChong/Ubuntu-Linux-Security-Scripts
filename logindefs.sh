#!/bin/bash
sed --i '/^PASS_WARN_AGE/s/999999/7/g' /etc/login.defs
sed --i '/^PASS_MAX_DAYS/s/99999/21/g' /etc/login.defs
sed --i '/^PASS_MIN_DAYS/s/0/7/g' /etc/login.defs
