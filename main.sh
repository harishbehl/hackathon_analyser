#!/bin/bash

BANNER="=========================================="
BANNER2="-----------------------------------------"


echo "Analysis in progress..."
for FILE in server*
#for FILE in server.log
do
printf "\n\n\n%s\n%s\n%s\n" $BANNER, $FILE, $BANNER >> Output_Summary.txt
echo "Analysis in progress..............Stay Tuned!!!!"
#Check for recommended settings

printf "\nWARN errors=%s" $(grep WARN $FILE|wc -l) >> Output_Summary.txt
printf "\nERROR errors=%s" $(grep ERROR $FILE|wc -l) >> Output_Summary.txt
printf "\nSEVERE errors=%s\n" $(grep SEVERE $FILE|wc -l) >> Output_Summary.txt
echo

grep -A1 "Encountered runtime exception" $FILE|grep -vf ExcludeErrors|\
sed -f normalize|sort|\uniq -c >> Output_Summary.txt

echo
grep -A1 "Encountered a server exception" $FILE|grep -vf ExcludeErrors|\
sed -f normalize|sort|\uniq -c >> Output_Summary.txt
echo 
grep SEVERE $FILE|grep -vf ExcludeErrors|\
sed -f normalize|	
sort|\
	uniq -c >> Output_Summary.txt
echo

done
