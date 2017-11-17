#!/bin/bash
opensock=`/usr/bin/lsof -Pnl +M -i4 | grep LISTEN`
while read -r line;do
  PID=`echo "$line" | awk '{print $2}'` 
  FP=`ls -l /proc/$PID/exe | awk '{print $11}'`
  if grep --quiet "Usage: ncat" $FP; then
     echo "yes"; exit 0;  
  fi
done <<< "$opensock"
echo "no"; exit 1

