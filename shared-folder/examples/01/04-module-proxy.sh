#!/bin/sh -ex

net-snmp-config --snmpd-module-list | tr ' ' \\012 | grep -i proxy
