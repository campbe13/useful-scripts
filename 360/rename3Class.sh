#!/bin/bash 
# PMC
# 2016-02-20
# rename3Class.sh
#
# rename moodle .java files
#
#  1st get rid of spaces 1st see rename1Space.sh
#  2nd rename  to first name  from Firstname_blahblah.java Firstname.java see rename2.sh
#  use the file name to insert it as a class name this file rename3Class.sh
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
      # old regex egrep "^public class" $file | grep { >/dev/null
   # new regex:
   # begin w 0 or more spaces 
   # public
   # one or more spaces
   # class

   # check for curly brace on same line as class
   egrep "^[[:space:]]*public[[:space:]]+class" $file  | grep { >/dev/null  
   # return code 1 if no closing {  (i.e. not on same line as class   
   # return code 0 if closing {    (i.e. on same line as class)
   curly=$?      
 
   # n.b. sed no need to escape * + etc if using ''
   # make original class statement into a comment
   # does not match:
   #sed -ir 's/^[[:space:]]*public[[:space:]]+class/\/\/public class/g' $file
   # matches but any indents no match:
   # had to do it twice 1st for begin with no space
   sed -ir 's/^public[[:space:]]\+class/\/\/public class/g' $file
   # had to do it twice 2nd for begin with >= 1 space
   sed -ir "s/^[[:space:]]\+public[[:space:]]\+class/\/\/public class/g" $file 

   # insert new class statement with file name as class name
   if [[ $curly == 1 ]]  ; then
        sed -ir "/public[[:space:]]\+class/a public class $className " $file
   else
        sed -ir "/public[[:space:]]\+class/a public class $className {" $file
   fi
  done
  unset IFS
