#!/bin/bash
# PMC
# 2016-02-20
#  run assigment 3, input range  10, 5,4,7,9  then 11,20,3,2,1

if [[ $# -eq 1  ]] &&  [[ -f $1 ]] ; then
   fn=$1
   else
   exit 5
fi

  class=$(echo $fn |cut -d \. -f 1)
  printf "%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d" 10 5 4 7 9 11 20 3 2 1 |java $class
