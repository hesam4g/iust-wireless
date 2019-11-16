#!/bin/bash

#Main shell script for generating appropriate data for histograms
#$1 (first command line parameter): run length
#$2 (second command line parameter): Target SSID
#Usage: should be run as root, example:
# ./histscan.sh sudo

#sudo ifconfig wlan0 down
#sudo iwconfig wlan0 mode monitor
#sudo ifconfig wlan0 up

let i=0;

rm ./mean.old
rm ./air1.txt

touch ./mean.rssi

echo "Do you want to clear last History !! ??? (y/n)"
read answer
if [ "$answer" == "y" ];
then
	echo "History cleared."
	rm ./mean.base
	touch ./mean.base
else
	awk -F '\t' -v OFS='\t' '{$4=0; print }' ./mean.base > ./mean.temp
	cp ./mean.temp ./mean.base
	rm ./mean.temp
fi

echo "press Enter to continue."
read

while [ "$i" -lt "$1" ]; do

let i="$i+1";

tshark -i wlan0 -Y wlan.fc.type_subtype==0x08 -T fields -e wlan.sa -e radiotap.dbm_antsignal -e wlan_mgt.ssid -a duration:1 > air1.txt

#cat ./air1.txt >> ./air2.txt

echo -e "SSID\tAVG-RSSI" > mean.old

awk -F '\t' -v OFS='\t' '{$4=0;$3="-100"; print }' ./mean.base > ./mean.temp
cp ./mean.temp ./mean.base
rm ./mean.temp


for SSID in `cat ./air1.txt | cut -f 3 | sort -u`
do
	RSSI=$(cat air1.txt | grep $SSID | cut -f2 | ./rssiMean.sh | cut -d '.' -f1)
	if [ -z "$RSSI" ]; then let RSSI=-100; fi
	#let RSSI="$RSSI+100";
	
	grep -q $SSID ./mean.base

	if [ $? == 0 ];
	then
		# Ghablan Boodeh
		RowNo=`cat ./mean.base | grep $SSID | cut -f 2`
		awk -F '\t' -v OFS='\t' '{if (NR=='$RowNo')$3='$RSSI';$4=1; print }' ./mean.base > ./mean.temp
		cp ./mean.temp ./mean.base
		rm ./mean.temp
	else
		# Ghablan Naboode
		AllRowNo=`wc -l ./mean.base | cut -d ' ' -f 1`
		if [ $AllRowNo == 0 ];
		then
			NewRowNo=1
		else
			LastRowNo=`sed -n $AllRowNo'p' ./mean.base | cut -f 2`
			let NewRowNo="$LastRowNo+1"
		fi
		echo -e $SSID"\t"$NewRowNo"\t"$RSSI"\t1" >> ./mean.base
	fi
done

awk -F '\t' -v OFS='\t' '{if ($4==0)$3="-100"; print }' ./mean.base > ./mean.temp
cp ./mean.temp ./mean.base
rm ./mean.temp

cat ./mean.base | cut -f 1,3 >> ./mean.old
cp ./mean.old ./mean.rssi

done

