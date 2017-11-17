#!/bin/bash

# Check all Listening Processes for NetCat
#   This uses a simple check to see if "Usage: ncat" 
#   is found in the file
#
# Only checks for the First Running Instance
#
#  Return Value:
#   0 = Yes, Netcat found
#   1 = No, Netcat not found
#   < 0 = An Error happened
#
#  Mj Wyrick, Sept 30, 2017

# What to grep for to find netcat
#  This array contains different strings we have found
#  in different versions of netcat, we check them all
SEARCH=( "usage: nc" "Usage: ncat" )

# Flag if we found it
FOUND=0

# Extended output
EXTOUT=0

# Vebose Outout
VERBOSE=0

# Kill netcat PID
KILLNC=0

# Show what we found in the file
SHOWSEARCH=0

#Define a Function to output to Stderr
echoerr() { echo "$@" 1>&2; }

# Print out script help
printhelp() {
  echoerr "Usage: $0 [OPTION]"
  echoerr "  -e, --extout     Use Extended output (i.e. print PID)"
  echoerr "  -s, --showsearch Show what we found in the file"
  echoerr "  -v, --verbose    Verbose output, includes showsearch"
  echoerr "      --killnc     Kill the netcat process if found"
  echoerr "  -h, --help       print this Help"
}

##########  Start Of Running Script ##########

# Parse Command Line
for i in "$@"
do
  case $i in
    -e|--extout)
      EXTOUT=1
      ;;
    -s|--showsearch)
      SHOWSEARCH=1
      ;;
    -v|--verbose)
      VERBOSE=1
      SHOWSEARCH=1
      ;;
    --killnc)
      KILLNC=1
      ;;
    -h|--help)
      printhelp
      exit 1
      ;;
    *)
      echoerr ""
      echoerr "  Invalid OPTION"
      echoerr ""
      printhelp
      exit 1
  esac
done

# Grab a list of all Listening Processes
opensock=`/usr/bin/lsof -Pnl +M -i4 | grep LISTEN`
if [ -z "$opensock" ]
then
  echoerr "Can't get lsof list of processes, Check permissions."
  exit -1
fi

# Run thru the list and check for NetCat
while read -r line #takes opensock, and pulls 
do
  # Print out this line if Verbose
  if [ $VERBOSE -eq 1 ]
  then
    echo "Line = $line"
  fi

  # Grab the PID from the line
  PID=`echo "$line" | awk '{print $2}'` 
  if [ -z $PID ]
  then
    echoerr "Could not get PID from $line."
    exit -2
  fi

  # Get the full path the the process for PID
  FP=`ls -l /proc/$PID/exe | awk '{print $11}'`
  if [ -z "$FP" ]
  then
    echoerr "Can't find Proc file system entry for PID $PID."
    exit -3
  fi
  if [ $VERBOSE -eq 1 ]
  then
    echo "FP   = $FP"
  fi

  # do the Search of the File
  for i in "${SEARCH[@]}"
  do
    if grep --quiet "$i" $FP
    then
      if [ $SHOWSEARCH -eq 1 ]
      then
        echo "Found \"$i\" in $FP"
      fi
      FOUND=1
      break
    fi
  done
done <<< "$opensock"

# Create output
if [ $FOUND -eq 1 ]
then
  if [ $KILLNC -eq 1 ]
  then
    echo "Killing Process $PID"
    `kill -9 $PID`
  fi
  if [ $EXTOUT -eq 1 ]
  then
    echo "NetCat PID = $PID"
  else
    echo "yes"
  fi
  exit 0 
else
  echo "no"
  exit 1
fi

