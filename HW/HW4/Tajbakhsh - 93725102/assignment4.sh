#!/bin/bash


#sudo ifconfig wlan0 down
#sudo iwconfig wlan0 mode monitor
#sudo ifconfig wlan0 up

let i=0;

while [ $i -lt 1000 ]; do
	tshark -i wlan0 -f "type mgt subtype beacon" -T fields -e radiotap.dbm_antsignal -e wlan_mgt.ssid -a duration:10 | grep $2 >> tmp
	i=$(cat tmp | wc -l)
	echo i= $i
done
cat tmp | head -n 1000 > $1
rm tmp
