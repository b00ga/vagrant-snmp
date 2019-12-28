#!/bin/sh

echo "====> Print inetCidrRoute table..."
snmptable localhost inetCidrRoute

echo "====> Print inetCidrRoute table with parsed indexes and shortened headers..."
snmptable -Cbi localhost inetCidrRoute
