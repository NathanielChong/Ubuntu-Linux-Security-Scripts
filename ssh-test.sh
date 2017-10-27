#!/usr/bin/env roundup

describe "Check SSH"
it_checkssh_root() {
  exitcode=0
  /usr/bin/grep "^PermitRootLogin *no" /etc/ssh/sshd_config || exitcode=$?
  if [ $exitcode -ne 0 ]
  then
  ./echome.sh
  fi
  /usr/bin/grep "^PermitRootLogin *no" /etc/ssh/sshd_config
}
