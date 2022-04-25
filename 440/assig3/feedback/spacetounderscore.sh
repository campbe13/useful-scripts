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
usage () {
    echo $(basename $0) Rename file or from list of files, change blanks to underscores
    echo
    echo $(basename $0) file_that_is_list_of_filenames
    echo or
    echo $(basename $0) -f file with spacecs in name
}
if [[ $# -le 0 ]] ; then
    usage
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
if [[ $1  == -f ]] && [[ $# -eq 2 ]]  ; then
        rename $2
        exit 0 
# check for file 
elif [[ ! -f $1 ]] ; then
    usage
    exit 2
fi
# read from file
while  read -r fn
do
    rename $fn 
done < $@
