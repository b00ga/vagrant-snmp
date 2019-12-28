#!/bin/sh

echo "====> Example of the -Td flag..."
snmptranslate -Td SNMPv2-MIB::sysContact.0

echo "====> Example of the -Td flag with -On modifier..."
snmptranslate -Td -On SNMPv2-MIB::sysContact.0
