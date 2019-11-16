#!/bin/bash
#bash script used by histscan.sh to calculate mean of an input file (or stdin)

mean=$(
    cat $1 | awk '{sum+=$1}END{print sum/NR }'
)
echo $mean

