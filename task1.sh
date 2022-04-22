#!/bin/bash


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Programmer Name: Faiza Tasneem
#   Description: Argument Validation
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


if [ $# != 2 ]; then
  echo "Argument error."
else 
  echo $1 $2
fi 


