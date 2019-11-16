#!/bin/bash

addr=`pwd`

array=(OFF ON)

for ii in ${array[*]};
do
	cd $ii;
	for i in `ls ./`;
	do
		echo "=========================="$i
        	cd $i;
        	cp $addr/info.py ./;
        	python ./info.py;
		mv $i.png ../../img/
		echo ''
        	cd ..;
	done
	cd ..
done
