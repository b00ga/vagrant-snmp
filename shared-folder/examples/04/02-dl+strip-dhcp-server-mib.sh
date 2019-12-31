#!/bin/sh

cd

echo "====> Downloading DHCP Server MIB IETF draft document..."
curl -OL https://tools.ietf.org/id/draft-ietf-dhc-server-mib-10.txt
smistrip draft-ietf-dhc-server-mib-10.txt
