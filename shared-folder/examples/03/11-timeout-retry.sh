#!/bin/sh

echo "====> bulkwalk with 2 second timeout..."
snmpbulkwalk -t 2 localhost IF-MIB::ifInOctets

echo "====> bulkwalk with 2 second timeout and 10 retries..."
snmpbulkwalk -t 2 -r 10 localhost IF-MIB::ifInOctets
