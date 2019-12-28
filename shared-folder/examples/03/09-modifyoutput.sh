#!/bin/sh

echo "====> Printing OID as numbers (-On)..."
snmpget localhost -On UCD-DISKIO-MIB::diskIOReads.2

echo "====> Printing full OID (-Of)..."
snmpget localhost -Of UCD-DISKIO-MIB::diskIOReads.2

echo "====> Printing out without type (-Oq)..."
snmpget localhost -Oq UCD-DISKIO-MIB::diskIOReads.2

echo "====> Printing OID with value only (-Ov)..."
snmpget -Ov localhost UCD-DISKIO-MIB::diskIOReads.2

echo "====> Combine value-only and no-data-type (-Oqv) for bare value..."
snmpget -Oqv localhost UCD-DISKIO-MIB::diskIOReads.2

echo "====> Show example of interface where integer value is 'up'..."
snmpget localhost IF-MIB::ifOperStatus.1

echo "====> Modify previous query to show bare integer value for enum type..."
snmpget -Oeqv localhost IF-MIB::ifOperStatus.1
