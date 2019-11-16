clear all;
close all;
clc;

macList = fopen('macAddr.log');
allMac = fscanf(macList,'%c',[1 inf]);
all_Mac_Addresses=strrep(allMac,':','-');
all_Mac_Addresses
mac = input('Which MAC address you want to calculates the average RSSI? copy from above \n ','s');
mac = ['rssi_' mac];
file = fopen(mac);
a = fscanf(file,'%g %i',[2 inf]);
a = a';
fclose(file); 

rssi = a(:,2);
%calculate real value of rssi
for i=1:length(rssi)
    rssi(i) = exp(rssi(i)/10);
end
average = 10* log(mean(rssi))
fclose(macList);