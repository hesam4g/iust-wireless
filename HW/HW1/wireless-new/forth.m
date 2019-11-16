clear all;
close all;
clc;

macList = fopen('macAddr.log');
allMac = fscanf(macList,'%c',[1 inf]);
all_Mac_Addresses=strrep(allMac,':','-');
all_Mac_Addresses
mac = input('Which MAC address you want to show? copy from above \n ','s');
mac = ['rssi_' mac];
file = fopen(mac);
a = fscanf(file,'%g %i',[2 inf]);
a = a';
fclose(file); 

time = a(:,1);
rssi = a(:,2);
figure;
hold;
grid;
plot(time,rssi)


xlabel('time (s)');
ylabel('RSSI (dB)');
title(mac)
fclose(macList);