#!/bin/sh

echo "====> Fetching sysObjectID..."
SNMP_SYSOBJECTID=$(snmpget -Oqv localhost SNMPv2-MIB::sysObjectID.0)

echo "====> Show snmptranslate details for sysObjectID..."
snmptranslate -Td SNMPv2-MIB::sysObjectID.0

echo "====> Show snmptranslate details for the fetched OID..."
snmptranslate -Td -On ${SNMP_SYSOBJECTID}
