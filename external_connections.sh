#!/bin/bash
netstat -tn 2>/dev/null | grep -v 127.0.0.1 | grep : | awk '{print $5}' | sort | uniq -c | sort -nr | head

