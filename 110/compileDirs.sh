#!/bin/bash
# pmc
# run after toDirMoodle.sh 
# cd to each directory & compile the classs file 
#
if [[ $# -ne 1 ]] ; then
    echo "Missing class name - single argument"
	exit 1
fi
class=$1
c
# ls dirs only (delete trailing /)
for i in $(ls -d */| tr -d /)
do
  cd $i
  javac $class.java
  cd ..
done
