#!/bin/bash
C='\e[94m'
NC='\e[0m'
path="/home/grid/testbed/tb156/"
cd $path
flagsForCmplrOptmztion=(O0 O1 O2 O3 Os Ofast)
i=0
for flag in ${flagsForCmplrOptmztion[@]}
do
echo -e "g++ compilation with $flag"
srcfile="result$i"
g++ -$flag fibonacci.cpp -o $srcfile -lm
time ./$srcfile
let "i=i+1"
echo -e "\n"
done
ml icc
flagsForIccCpu=$(cat /proc/cpuinfo | grep flags | uniq | cut -d: -f2 | cut -d" " -f2- | tr _ .)
flagsForIccOptmztion=(O2 Ofast)
i=0
for optmzFlag in ${flagsForIccOptmztion[@]}
do
for iccFlag in $flagsForIccCpu
do
srcfile="iccResult$iccFlag$optmzFlag"
icc -$optmzFlag -qopt-report-phase=vec fibonacci.cpp -o $srcfile -lm -x$iccFlag 2> log.txt
if [ $? -eq 0 ]
then
echo "icc compilation with -$optmzFlag and $iccFlag cpu extension:"
time ./$srcfile
echo -e "\n"
fi
done
done 
