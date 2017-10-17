#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
START=$(wc -l < /opt/custom/blockscript/output/autoshun.txt)

for f in /opt/custom/blockscript/processing/index.html*;
do echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Processing ...$f file${NC}";
cat $f | tail -n +5 | cut -d',' -f1 > /opt/custom/blockscript/processing/templist.txt

while read ip; do
echo $ip
sudo grep -q -F $ip /opt/custom/blockscript/output/autoshun.txt || echo $ip >> /opt/custom/blockscript/output/autoshun.txt;
done </opt/custom/blockscript/processing/templist.txt
done
TOTAL=$(wc -l < /opt/custom/blockscript/output/autoshun.txt)
COUNT=$(($TOTAL - $START))
echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Added: ${COUNT} IP-addresses to the database${NC}";
echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Finished processing AUTOSHUN feed!${NC}";
echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Total IP-addresses in this feed: ${TOTAL}${NC}";
sort -nu -t. -k1 -k2 -k3 -k4  '/opt/custom/blockscript/output/autoshun.txt' -o '/opt/custom/blockscript/output/autoshun.txt'
rm /opt/custom/blockscript/processing/templist.txt;
rm /opt/custom/blockscript/processing/index.html*;
