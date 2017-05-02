#!/bin/bash
# PMCampbell
# rename files input
# change spaces to underscorses
if [[ $# -le 0 ]] ; then
    echo $(basename $0) Rename file list, change blanks to underscores
    echo $(basename $0 ) filename
    exit 1
fi
while  read -r fn
do
    echo $fn
    newfn=$(echo $fn | tr ' ' '_' )
    mv -v "$fn" $newfn 
done < $1
