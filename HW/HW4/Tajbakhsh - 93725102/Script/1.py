import math

out = open("1.result" , "w")

avgList = []

for i in range(1,26):
	myFile = open(str(i) , "r")
	sum = 0	
	for line in myFile:
		sum += int(line.split()[0])
	avgList.append(sum/1000.0)

distances = [1,2,3,4,4,4,5,5,5,6,6,6,7,7,8,8,9,9,10,10,11,11,16,14,14]
	

n=0
soorat = 0
makhraj = 0

for i in range(1,25):
	soorat += (avgList[0] - avgList[i]) * math.log10(distances[i])
	makhraj += math.log10(distances[i])**2

n = soorat/(10*makhraj)
print('n = ' + str(n))
out.write('n = ' + str(n) + "\n")
e=0
for i in range(1,25):
	e += (avgList[i]-avgList[0] + 10*n*math.log10(distances[i]))**2
#print ('e = '+ str(e))
	

sigma = math.sqrt(e/(25*24))
print('sigma = ' + str(sigma))
out.write('sigma = ' + str(sigma) + "\n")

out.close()

















