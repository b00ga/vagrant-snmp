#!/bin/sh

echo "====> Get UCD-DISKIO-MIB::diskIOReads.2..."
snmpget localhost UCD-DISKIO-MIB::diskIOReads.2

echo "====> Get with only diskIOWrites.2..."
snmpget localhost diskIOWrites.2

echo "====> bulkwalk with only diskIOW..."
snmpbulkwalk localhost diskIOW

echo "====> bulkwalk with the 'private' shortcut..."
snmpbulkwalk localhost private

