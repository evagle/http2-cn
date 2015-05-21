#!/bin/bash
##
# @file a.sh
# @Brief 
# @author  Brian 
# @version 1.0
# @date 2015-05-20

awk -F'[()]' '{print $2}' SUMMARY.md > a.txt

while read -r line
do
    if [ ! -f "$line" ] && [ -n "$line" ] 
    then
        echo "$line" "created"
        touch "$line"
    fi
    #echo $line
done < a.txt

rm -f a.txt

