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







