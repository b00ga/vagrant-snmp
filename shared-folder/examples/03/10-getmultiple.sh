#!/bin/sh

echo "====> bulkget IOReads..."
snmpbulkget -v2c -c insecureRO localhost UCD-DISKIO-MIB::diskIOReads

echo "====> same bulkget with only 4 results..."
snmpbulkget -Cr4 localhost diskIOReads

echo "====> bulkget IOReads and IOWrites..."
snmpbulkget -Cr4 localhost diskIOReads diskIOWrites

echo "====> bulkget UpTime and udpPorts..."
snmpbulkget -Cn2 localhost sysUpTime udpNoPorts

echo "====> bulkget UpTime, udpPorts, IOReads and IOWrites..."
snmpbulkget -Cn2 -Cr4 localhost sysUpTimeInstance udpNoPorts diskIOReads diskIOWrites




