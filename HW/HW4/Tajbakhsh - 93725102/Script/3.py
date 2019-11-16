import math

avgList = []
lis = []
P = []
FadeMargin = []
NAnthen = []
distances = [1,2,3,4,4,4,5,5,5,6,6,6,7,7,8,8,9,9,10,10,11,11,16,14,14]
for i in range(1,26):
	myFile = open(str(i) , "r")
	lis = []
	sum = 0	
	for line in myFile:
		a = line.split()[0]
		sum += int(a)
		lis.append(int(a))
	
	avg = sum/1000.0
	avgList.append(avg)
	count = 0
	for i in lis:
		if(i < avg):
			count+=1
	tmp_P  = count/1000.0
	P.append(tmp_P)
	num = 1
	while(tmp_P > 0.01):
		tmp_P*=tmp_P
		num += 1
	
	NAnthen.append(num)
	
	lis.sort()
	
	FadeMargin.append(lis[99])
	myFile.close()


output = open("3.result" , "w")
output.write("Loc" + "\t" + "Dis" + "\t" +"Prob" + "\t" + "FadeMargin" + "\t\t\t" + "Avg RSSI" + "\t" + "Antenna" "\n")
for i in range(25):
	output.write(str(i+1) + "\t" + str(distances[i]) +"\t" + str(P[i]) + "\t" + str(FadeMargin[i] - avgList[i]) + "\t" + str(avgList[i]) + "\t" + str(NAnthen[i]) + "\n")
output.close()
print(avgList)
print(P)


	
	

