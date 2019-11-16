clear all;
close all;
clc;

macList = fopen('macAddr.log');
allMac = fscanf(macList,'%c',[1 inf]);
all_Mac_Addresses=strrep(allMac,':','-');
all_Mac_Addresses
mac = input('Which MAC address you want to calculates the average RSSI? copy from above \n ','s');
threshold = input('How much is Threshold? \n ');
mac = ['rssi_' mac];
file = fopen(mac);
a = fscanf(file,'%g %i',[2 inf]);
a = a';
fclose(file); 

rssi = a(:,2);
count = 0;
for i=1:length(rssi)
    if(rssi(i) < threshold)
        count = count + 1;
    end
end
report = ' the percentage of RSSI measurements that are below given threshold is: '
(count*100)/length(rssi)
fclose(macList);