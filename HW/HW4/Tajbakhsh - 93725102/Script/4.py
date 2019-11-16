import math

avgList = []
lis = []

FadeMargin = []

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
	for j in lis:
		if(i < avg):
			count+=1
	
	lis.sort()
	
	FadeMargin.append(lis[99])
	
	myFile.close()


