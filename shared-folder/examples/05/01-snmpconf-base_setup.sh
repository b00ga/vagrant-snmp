#!/bin/sh -ex

cd
if [ ! -d chap05 ]; then
   mkdir chap05
fi
cd chap05
if [ -f ./snmpd.conf ]; then
   rm -f ./snmpd.conf
fi
if [ -f /etc/redhat-release ]; then
   CRONPROC=crond
else
   CRONPROC=cron
fi
OS_NAME=$(uname -s)

if [ "$OS_NAME" = "FreeBSD" ]; then
   SNMPCONF_PREFIX=/usr/local/etc/snmp
else
   SNMPCONF_PREFIX=/etc/snmp
fi

expect << EOS
set timeout -1
spawn snmpconf -g basic_setup
expect "Read in which"
send "none\r"
expect "system MIB group"
send "y\r"
expect "The location of the system"
send "MWL global datacenter\r"
expect "The contact information"
send "mwl@mwl.io\r"
expect "sysServices.0 OID"
send "y\r"
expect "does this host offer physical services"
send "0\r"
expect "does this host offer datalink/subnetwork services"
send "0\r"
expect "does this host offer internet services"
send "1\r"
expect "does this host offer end-to-end services"
send "1\r"
expect "does this host offer application services"
send "1\r"
expect "configure the agent's access control?"
send "y\r"
expect "allow SNMPv3 read-write user based access"
send "y\r"
expect "The SNMPv3 user that should have read-write access"
send "secureRW\r"
expect "noauth|auth|priv"
send "priv\r"
expect "should be restricted to"
send "\r"
expect "another rwuser line"
send "n\r"
expect "allow SNMPv3 read-only user based access"
send "y\r"
expect "the SNMPv3 user that should have read-only access"
send "secureRO\r"
expect "noauth|auth|priv"
send "priv\r"
expect "should be restricted to"
send "\r"
expect "another rouser line"
send "n\r"
expect "allow SNMPv1/v2c read-write"
send "y\r"
expect "community name to add read-write access"
send "insecureRW\r"
expect "hostname or network address to accept this community name from"
send "203.0.113.0/24\r"
expect "should be restricted to"
send "\r"
expect "another rwcommunity line?"
send "n\r"
expect "allow SNMPv1/v2c read-only"
send "y\r"
expect "community name to add read-only access"
send "insecureRO\r"
expect "hostname or network address to accept this community name from"
send "203.0.113.0/24\r"
expect "should be restricted to"
send "\r"
expect "another rocommunity line?"
send "n\r"
expect "the agent will send traps"
send "n\r"
expect " monitor various aspects of your system"
send "y\r"
expect "ability to monitor processes"
send "y\r"
expect "process you want to check on"
send $CRONPROC
send "\r"
expect "Maximum number of processes"
send "1\r"
expect "Minimum number of processes"
send "1\r"
expect "another proc line?"
send "y\r"
expect "process you want to check on"
send "php-fpm\r"
expect "Maximum number of processes"
send "10\r"
expect "Minimum number of processes"
send "1\r"
expect "another proc line?"
send "y\r"
expect "process you want to check on"
send "sendmail\r"
expect "Maximum number of processes"
send "10\r"
expect "Minimum number of processes"
send "\r"
expect "another proc line?"
send "n\r"
expect "monitor disk space?"
send "y\r"
expect "disk partion to be checked on"
send "/tmp/\r"
expect "minimum amount of space"
send "10%\r"
expect "another disk line?"
send "y\r"
expect "disk partion to be checked on"
send "/\r"
expect "minimum amount of space"
send "99%\r"
expect "another disk line?"
send "n\r"
expect "monitor load average?"
send "y\r"
expect "1 minute load average"
send "10\r"
expect "5 minute load average"
send "8\r"
expect "15 minute load average"
send "5\r"
expect "another load line?"
send "n\r"
expect "monitor file sizes?"
send "y\r"
expect "path to the file you wish to monitor"
send "/var/log/messages\r"
expect "maximum size (in kilobytes)"
send "1048576\r"
expect "another file line?"
send "y\r"
expect "path to the file you wish to monitor"
send "/var/log/secure\r"
expect "maximum size (in kilobytes)"
send "5\r"
expect "another file line?"
send "n\r"

expect eof
EOS

cp ./snmpd.conf $SNMPCONF_PREFIX/snmpd.conf
service snmpd restart
