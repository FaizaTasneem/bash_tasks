#!/bin/sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Programmer Name: Faiza Tasneem
#   Description: Checking existence of input file
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


if [ -f $1 ]; then
  echo  "File exists."
else 
  echo "File does not exist."
fi
