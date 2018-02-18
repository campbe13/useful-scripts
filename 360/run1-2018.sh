#!/bin/bash
# PMC
# 2018-02-17
#  run assigment 1
#  integer palindrom
#  input 123 then 567

# if there is an argument, it will be a list of class or
# java file names to use (truncate what's after the dot)
# if not make a list of all classes in cwd
if [[ $# -eq 1  ]] &&  [[ -f $1 ]] ; then
   list=$(cat $1)
   else
   list="*.class"
fi

outfn=assign1.output.$(date +%F).txt
for fn in $list
do
  class=$(echo $fn |cut -d \. -f 1)
  echo "running " $class |tee -a $outfn
  printf "%d\n" 123 |java $class  >> $outfn
  printf "%d\n" 567 |java $class  >> $outfn
  echo "____________________" >>  $outfn
  done
