#!/bin/bash
declare -ia portList=(22, 23, 25, 26);

for p in ${portList[@]}
do
	ufw deny $p
done