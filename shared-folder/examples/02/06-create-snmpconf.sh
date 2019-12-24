#!/bin/sh -ex

mkdir -p $HOME/.snmp

cat > $HOME/.snmp/snmp.conf << EOF
defVersion 3
defSecurityName secureRW
defAuthPassphrase beVeryCareful
defAuthType SHA
defPrivPassphrase moreCarefulThanThat
defPrivType AES
defSecurityLevel authPriv
EOF
