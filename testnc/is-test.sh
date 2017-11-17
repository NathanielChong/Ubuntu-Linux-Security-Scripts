#!/usr/bin/env roundup

#
# Roundup Checking Script to test isncrunning
#
#  Return Value:
#   0 = All Tests Pass
#   1 = At least one Test Failed
#
#  MJ Wyrick, Oct 4, 2017
#
TMPFILENAME="tmp.output.isnc.txt"

describe "Test that isncrunning.sh works as it should."

# Run before every test
before() {
	:
}

# run after every test if nc is not running
after() {
	rm $TMPFILENAME 2>/dev/null || true
}

# Check the return value
it_retval_check_without() {
	ret=0
	sudo ./isncrunning.sh || ret=$?
	[ $ret -eq 1 ] 
}

# Check the return value if nc is running
it_retval_check_with() {
	ret=0
	./renamed -l 9876 &
	PID=$!
	sudo ./isncrunning.sh || ret=$?
	kill -9 "$PID"
	[ $ret -eq 0 ] 
}

# check that the baseline impl works to test environment
it_check_baseline_no() {
	sudo ./baseline.sh > $TMPFILENAME || true
    cat $TMPFILENAME
    grep "^no$" $TMPFILENAME
    LINECOUNT=`wc -l $TMPFILENAME | cut -f1 -d' '`
    [[ $LINECOUNT -eq 1 ]]
}

# check that the baseline impl works to test environment
it_check_baseline_yes() {
	./renamed -l 9876 &
	PID=$!
	sudo ./baseline.sh > $TMPFILENAME || true
	kill -9 "$PID"
    cat $TMPFILENAME
    grep "^yes$" $TMPFILENAME
    LINECOUNT=`wc -l $TMPFILENAME | cut -f1 -d' '`
    [[ $LINECOUNT -eq 1 ]]
}

# check that the isncrunning.sh script returns the correct value without nc
it_check_for_no() {
	sudo ./isncrunning.sh > $TMPFILENAME || true
    cat $TMPFILENAME
    grep "^no$" $TMPFILENAME
    LINECOUNT=`wc -l $TMPFILENAME | cut -f1 -d' '`
    [[ $LINECOUNT -eq 1 ]]
}

# check that the isncrunning.sh script returns the correct value with nc
it_check_for_yes() {
	./renamed -l 9876 &
	PID=$!
	sudo ./isncrunning.sh > $TMPFILENAME || true
	kill -9 "$PID"
    cat $TMPFILENAME
    grep "^yes$" $TMPFILENAME
    LINECOUNT=`wc -l $TMPFILENAME | cut -f1 -d' '`
    [[ $LINECOUNT -eq 1 ]]
}

