#!/bin/bash
# PMCampbell
# rename1Space.sh
#
# rename moodle .java files
#
#  1st get rid of spaces 1st this file rename1Space.sh
#  2nd rename  to first name  from Firstname_blahblah.java Firstname.java see rename2.sh
#  3rd use the file name to insert it as a class name see rename3Class.sh
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
