#!/bin/sh -ex

snmpusm -v3 -l priv -u templateshaaes -A securePassword -X securePassword -a SHA -x AES -Ca localhost passwd securePassword beVeryCareful secureRW
snmpusm -v3 -l priv -u templateshaaes -A securePassword -X securePassword -a SHA -x AES  -Cx localhost passwd securePassword moreCarefulThanThat secureRW
