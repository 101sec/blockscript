#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

files=(/opt/custom/blockscript/output/*.txt)


for file in "${files[@]}"; do 
echo -e "${NC}[${GREEN}+${NC}] ${GREEN}Adding Malicious IP-addresses to Firewall ...$f file${NC}";
  while read ip; do
	sudo /usr/local/bin/addenemy $ip;
  done < "$file"
done
