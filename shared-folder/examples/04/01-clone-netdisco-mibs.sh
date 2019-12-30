#!/bin/sh

cd
mkdir -p .snmp/mibs

echo "====> Cloning netdisco mibs git repo..."
cd .snmp/mibs
git clone https://github.com/netdisco/netdisco-mibs
