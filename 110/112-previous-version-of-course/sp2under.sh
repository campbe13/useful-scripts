#!/bin/bash
#PMC
# rename file, changes spaces to underscores
# usage:
#  ./sp2under.sh ` ls *.java` 
#  
ls | while read -r fn
do
    mv -v "$fn" `echo $fn | tr ' ' '_' `
done
