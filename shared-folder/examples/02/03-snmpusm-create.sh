#!/bin/sh -ex

OS_NAME=$(uname -s)

if [ "$OS_NAME" = "FreeBSD" ]; then
   SNMPCONF_PREFIX=/usr/local/etc/snmp
else
   SNMPCONF_PREFIX=/etc/snmp
fi

snmpusm -v3 -l priv -u templateshaaes -A securePassword -X securePassword -a SHA -x AES localhost create templatedefault

snmpusm -v3 -l priv -u templateshaaes -A securePassword -X securePassword -a SHA -x AES localhost create secureRW templateshaaes
snmpusm -v3 -l priv -u templateshaaes -A securePassword -X securePassword -a SHA -x AES localhost create secureRO templateshaaes

if ! grep 'rwuser secureRW' $SNMPCONF_PREFIX/snmpd.conf; then
   echo "rwuser secureRW" >> $SNMPCONF_PREFIX/snmpd.conf
fi
if ! grep 'rouser secureRO' $SNMPCONF_PREFIX/snmpd.conf; then
   echo "rouser secureRO" >> $SNMPCONF_PREFIX/snmpd.conf
fi
