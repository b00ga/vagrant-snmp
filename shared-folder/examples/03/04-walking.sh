#!/bin/sh

echo "====> Walking the enterprise MIB..."
snmpbulkwalk localhost .1.3.6.1.4.1

echo "====> Walking the entire MIB from .1..."
snmpbulkwalk localhost .1
