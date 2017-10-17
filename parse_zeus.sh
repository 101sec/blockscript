#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
START=$(wc -l < /opt/custom/blockscript/output/zeus.txt)

for f in /opt/custom/blockscript/processing/blocklist.php*;
do echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Processing ...$f file${NC}";
cat $f | tail -n +7 > /opt/custom/blockscript/processing/tempblocklist.txt

while read ip; do
echo $ip
sudo grep -q -F $ip /opt/custom/blockscript/output/zeus.txt || echo $ip >> /opt/custom/blockscript/output/zeus.txt;
done </opt/custom/blockscript/processing/tempblocklist.txt
done
TOTAL=$(wc -l < /opt/custom/blockscript/output/zeus.txt)
COUNT=$(($TOTAL - $START))
echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Added: ${COUNT} IP-addresses to the database${NC}";
echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Finished processing ZEUS feed!${NC}";
echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Total IP-addresses in this feed: ${TOTAL}${NC}";
sudo sort -nu -t. -k1 -k2 -k3 -k4  '/opt/custom/blockscript/output/zeus.txt' -o '/opt/custom/blockscript/output/zeus.txt'
rm /opt/custom/blockscript/processing/tempblocklist.txt;
