#!/bin/bash
cat airlog.txt | grep $1 | cut -f 2 > output.log
echo  "$1's  RSSI levels saved in output.log"