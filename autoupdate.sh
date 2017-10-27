#!/bin/bash
touch /etc/apt/apt.conf.d/10periodic
echo APT::Periodic::Update-Package-Lists "1"; >> /etc/apt/apt.conf.d/10periodic
echo APT::Periodic::Download-Upgradeable-Packages "1"; >> /etc/apt/apt.conf.d/10periodic
echo APT::Periodic::AutocleanInterval "7"; >> /etc/apt/apt.conf.d/10periodic
echo APT::Periodic::Unattended-Upgrade "1"; >> /etc/apt/apt.conf.d/10periodic