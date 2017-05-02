#!/bin/bash 
# PMC
# 2016-02-20
# 
# rename moodle .java files
#
#  1st get rid of spaces 1st see rename1Space.sh
#  2nd rename  to first name  from Firstname_blahblah.java Firstname.java see rename2.sh
#  use the file name to insert it as a class name
#
  if [[ $# -le 0 ]] ; then
    echo $(basename $0) need a list of files
    exit 2
  fi
  IFS=$(echo -en "\n\b")
  for file in $*
  do
   # make the public class statement 
   className=$(echo $file|cut -d \. -f 1)
   
   echo $className in $file
   # check for curly brace on same line as class
   egrep "^public class" $file | grep { >/dev/null
   # return code 1 if no closing {  (i.e. not on same line as class   
   # return code 0 if closing {    (i.e. on same line as class)
   curly=$?      
 
   sed -i 's/^public class/\/\/public class/g' $file
 
   if [[ $curly == 1 ]]  ; then
        sed -i "/public class/a public class $className " $file
   else
        sed -i "/public class/a public class $className {" $file
   fi
  done
  unset IFS