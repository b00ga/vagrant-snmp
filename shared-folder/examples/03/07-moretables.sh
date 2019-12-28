#!/bin/sh

echo "====> Print diskIO table with column-width 60..."
snmptable -Cibw 60 localhost diskIO

echo "====> Print diskIO table with no column headers and comma separated..."
snmptable -Cf , -CH localhost diskIO

echo "====> Print diskIO table parsed to only print IOReads/Writes..."
snmptable localhost diskio | awk '{print $2,$5,$6}' | column -t

