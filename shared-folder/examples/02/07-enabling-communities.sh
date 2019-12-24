#!/bin/sh -ex

OS_NAME=$(uname -s)
RESTART_SNMPD=no

if [ "$OS_NAME" = "FreeBSD" ]; then
   SNMPCONF_PREFIX=/usr/local/etc/snmp
else
   SNMPCONF_PREFIX=/etc/snmp
fi

if ! grep 'rocommunity insecureRO' $SNMPCONF_PREFIX/snmpd.conf; then
   echo "rocommunity insecureRO" >> $SNMPCONF_PREFIX/snmpd.conf
   RESTART_SNMPD=yes
fi
if ! grep 'rwcommunity insecureRW' $SNMPCONF_PREFIX/snmpd.conf; then
   echo "rwcommunity insecureRW" >> $SNMPCONF_PREFIX/snmpd.conf
   RESTART_SNMPD=yes
fi
if [ "$RESTART_SNMPD" = "yes" ]; then
   service snmpd restart
fi
