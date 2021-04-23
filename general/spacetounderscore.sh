#!/bin/bash
# PMCampbell
# spacetounderscore
#
# rename  spaces to underscores
# given a list of file names
#
# 2021-04-23
# add option to rename 1 file
#
if [[ $# -le 0 ]] ; then
    echo $(basename $0) Rename file list, change blanks to underscores
    echo $(basename $0 ) file_that_is_list_of_filenames
    exit 1
fi
rename () { 
    fn=$@
    if [[ -e $fn ]] ; then 
        echo $fn
    	newfn=$(echo $fn | tr ' ' '_' )
	mv -v "$fn" $newfn 
    else 
        echo $fn does not exist
        return 1
    fi
}
# check for single file rename
if [[ $1  == -t ]] && [[ $# -eq 2 ]]  ; then
        rename $2
        exit 0 
# check for file 
elif [[ ! -f $1 ]] ; then
    echo $(basename $0 ) file_that_is_list_of_filenames
    echo first arg must be a file
    exit 1
fi
# read from file
while  read -r fn
do
    rename $fn 
done < $@
