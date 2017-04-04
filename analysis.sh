#!/bin/bash

BANNER="=========================================="
BANNER2="-----------------------------------------"


for FILE in server*
#for FILE in server.log
do
printf "\n\n\n%s\n%s\n%s\n" $BANNER, $FILE, $BANNER >> test1.txt


#Check for recommended settings

printf "\nWARN errors=%s" $(grep WARN $FILE|wc -l) >> test1.txt
printf "\nERROR errors=%s" $(grep ERROR $FILE|wc -l) >> test1.txt
printf "\nSEVERE errors=%s\n" $(grep SEVERE $FILE|wc -l) >> test1.txt
echo
grep -A1 "Encountered a server exception" $FILE|grep -vf pattern.txt|\
sed -f sed_pattern|sort|\uniq -c >> test1.txt
echo 
grep SEVERE $FILE|grep -vf pattern.txt|\
sed -f sed_pattern|	
sort|\
	uniq -c >> test1.txt
echo

done
