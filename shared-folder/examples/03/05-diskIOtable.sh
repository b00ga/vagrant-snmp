#!/bin/sh

echo "====> Print diskIO table..."
snmptable localhost diskIO

echo "====> Print diskIO again removing repeated parts of column headers..."
snmptable -Cb localhost diskIO
