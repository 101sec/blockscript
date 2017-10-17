#!/bin/bash
TOTAL=0;

for item in /opt/custom/blockscript/output/*.txt;
do
THISLIST=$(sudo wc -l $item | cut -d' ' -f 1)
TOTAL=$((TOTAL + $THISLIST))
done
echo $TOTAL
