#!/bin/bash
for line in `cat ./macAddr.log`
do
	grep $line airlog.txt | cut -f 1-2 >> rssi_`echo $line | tr : -` 
done < macAddr.log
