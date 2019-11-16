#!/bin/sh
cat airlog.txt | cut -f 3 | sort | uniq > macAddr.log
