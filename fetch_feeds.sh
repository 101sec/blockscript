#!/bin/bash
DISPLAY=:0 xterm -e bash -c "/opt/custom/blockscript/fetch_autoshun.sh"  &
DISPLAY=:0 xterm -e bash -c "/opt/custom/blockscript/fetch_blocklist.sh"  &
DISPLAY=:0 xterm -hold -e bash -c "/opt/custom/blockscript/parse_autoshun.sh"  &
