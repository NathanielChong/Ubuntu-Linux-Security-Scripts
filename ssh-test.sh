#!/usr/bin/env roundup

describe "Check SSH"
it_checkssh_root() {
  /bin/grep "^PermitRootLogin *no" /etc/ssh/sshd_config
}
