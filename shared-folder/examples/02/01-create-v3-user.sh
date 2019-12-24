#!/bin/sh -ex

OS_NAME=$(uname -s)

if [ "$OS_NAME" = "FreeBSD" ]; then
   SNMPCONF_PREFIX=/usr/local/etc/snmp
else
   SNMPCONF_PREFIX=/etc/snmp
fi

service snmpd stop
if [ -f $SNMPCONF_PREFIX/snmpd.conf -a ! -f $SNMPCONF_PREFIX/snmpd.conf.dist ]; then
   mv $SNMPCONF_PREFIX/snmpd.conf $SNMPCONF_PREFIX/snmpd.conf.dist
fi
if [ ! -d $SNMPCONF_PREFIX ]; then
   mkdir -p $SNMPCONF_PREFIX
fi
touch $SNMPCONF_PREFIX/snmpd.conf

net-snmp-create-v3-user -A securePassword -a SHA -x AES templateshaaes

service snmpd start
