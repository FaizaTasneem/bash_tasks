#!/bin/bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Programmer Name: Faiza Tasneem
#   Description: Argument Validation
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


if [ $# != 2 ]; then
  echo "Argument error."
else 
  input_file="$1"
  output_file="$2"
  echo "$input_file $output_file"
fi 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Programmer Name: Faiza Tasneem
#   Description: Checking existence of input file
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


if [ -f $1 ]; then
  echo  "File exists."
else 
  echo "File does not exist."
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Programmer Name: Faiza Tasneem
#   Description: Check if md5sum already exists in cksm.log file
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


key=$( md5sum "$1" )

if grep -qwF "$key" cksm.log; then
   echo "checksum already exists"
else 
   md5sum "$1" >> cksm.log
fi


# if grep -w "$key" cksm.log; then
#    echo "checksum already exists"
# else 
#    md5sum "$1" >> cksm.log
# fi


# condition=$( grep -c "$key" cksm.log )

# if [ "$condition" -gt 0 ]; then 
#    echo "checksum already exists"
# else
#    md5sum "$1" >> cksm.log
# fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Programmer Name: Faiza Tasneem
#   Description: Zip Split
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


unzip 'zip splitting.zip' 

cp ./'zip splitting'/* ./
ls ./'zip splitting' > output.txt

split -l 10 -d output.txt splitfile

find -name 'splitfile*' > file.txt

lines=$( cat file.txt | cut -c 3-)
i=1

for line in $lines
do 
   zip archive_$i -@ < "$line"
   i=$((i+1))
done


# zipsplit -n 260000 archive.zip



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Programmer Name: Faiza Tasneem
#   Description: Zip Split along with Index File in each zip
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


unzip 'zip splitting.zip'

cp ./'zip splitting'/* ./
ls ./'zip splitting' > output.txt

split -l 10 -d output.txt splitfile

find -name 'splitfile*' > file.txt

lines=$( cat file.txt | cut -c 3-)
i=1
j=1

for line in $lines
do 
   echo "$line"
   lines1=$( cat "$line" )   
   for line1 in $lines1
   do
     grep -B11 -A2 "${line1}" RWCU_NOTICES_DLC_1.xml >> demo_$j.xml
   done
   head -n5 RWCU_NOTICES_DLC_1.xml > index_$j.xml
   cat demo_$j.xml >> index_$j.xml
   tail -n2 RWCU_NOTICES_DLC_1.xml >> index_$j.xml
   find -name index_$j.xml >> "$line"
   
   zip archive_$i -@ < "$line"
   i=$((i+1))
   j=$((j+1))
done