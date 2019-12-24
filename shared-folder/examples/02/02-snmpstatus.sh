#!/bin/sh -ex

snmpstatus -v3 -l priv -u templateshaaes -A securePassword -a SHA -X securePassword -x AES localhost
