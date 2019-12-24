#!/bin/sh -ex

snmpget -v 2c -c insecureRO localhost SNMPv2-MIB::sysDescr.0
