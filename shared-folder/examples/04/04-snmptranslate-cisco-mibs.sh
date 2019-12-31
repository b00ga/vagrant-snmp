#!/bin/sh

cd

echo "====> Copy CISCO-AAA-SESSION-MI from netdisco to .snmp/mibs..."
cp .snmp/mibs/netdisco-mibs/cisco/CISCO-AAA-SESSION-MIB.my .snmp/mibs

echo "====> snmptranslate casnActiveTableEntries showing errors from missing definitions..."
snmptranslate -m CISCO-AAA-SESSION-MIB -Td -IR casnActiveTableEntries

echo "====> Copy CISCO-SMI from netdisco to .snmp/mibs..."
cp .snmp/mibs/netdisco-mibs/cisco/CISCO-SMI.my .snmp/mibs

echo "====> snmptranslate casnActiveTableEntries, now with CISCO-SMI ..."
snmptranslate -m CISCO-AAA-SESSION-MIB -Td -IR casnActiveTableEntries
