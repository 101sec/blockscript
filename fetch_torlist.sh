#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Fetching Dan's Tor Blocklist (FULL LIST)${NC}";
cd /opt/custom/blockscript/output/ && r=`sudo wget -U "Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" https://www.dan.me.uk/torlist/`;
if [ $? -ne 0 ]
  then echo -e "${NC}[${RED}+${NC}] ${RED}Download Failed${NC}";
  else echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Download Complete${NC}";
fi
exit

