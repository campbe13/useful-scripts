#!/bin/bash
# PMCampbell
# spacetounderscore
#
# rename  spaces to underscores
# given a list of file names
#
#
if [[ $# -le 0 ]] ; then
    echo $(basename $0) Rename file list, change blanks to underscores
    echo $(basename $0 ) file_that_is_list_of_filenames
    exit 1
fi
if [[ ! -f $1 ]] ; then
    echo $(basename $0 ) file_that_is_list_of_filenames
    echo first arg must be a file
    exit 1
fi
while  read -r fn
do
    echo $fn
    newfn=$(echo $fn | tr ' ' '_' )
    mv -v "$fn" $newfn 
done < $@
