#!/bin/bash
# PMCampbell
# underscoretospace.sh
# for the opposite see spacetounderscore.sh
# they should be merged, with an option
# but I can't be arsed
#
# rename  spaces to underscores only 1st 
# *&#*(&# moodle spaces in names only
# given a list of file names
#
# 2021-05-02
usage () {
    echo $(basename $0) Rename file or from list of files, change underscores to blanks
    echo
    echo $(basename $0) file_that_is_list_of_filenames
    echo or
    echo $(basename $0) -f file with underscores in name
}
if [[ $# -le 0 ]] ; then
    usage
    exit 1
fi
rename () { 
    fn=$@
    if [[ -e $fn ]] ; then 
        echo $fn
        # first 2 underscores only
    	newfn=$(echo $fn |  sed -e 's/_/ /')
	mv -v "$fn" "$newfn"
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
