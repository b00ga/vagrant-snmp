#!/bin/sh -ex

expect << EOS
set timeout -1
spawn snmpconf -a -r all -I /tmp/snmp
expect "Select File: "
send -- "3\r"
expect "Select section: "
send -- "finished\r"
expect "Select File: "
send -- "quit\r"
expect eof
EOS
