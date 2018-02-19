#!/bin/bash
# P Campbell
# 2011-12-13-14-15-16-17-18		 
# 
# save xls, xlsx as cvs, reads in cvs and 
# split the cvs marks
# row line 1 is the col header
# row line 2 is the max marks for col
# row line 3-x are the marks, 
#
# col first is the student name
# other cols are the items
#
# requires no spaces in the col headers & 
# no spaces in the student names
# see section # print for each  comment any you don't need
count=0
if [[ $# -ne 1 ]] ; then
   echo $(basename $i ) need a file name, csv
   exit
fi

fn=$1

# line 1  headers
line=$(head -1 $fn) 
  hname=$(echo $line|cut -d "," -f 1)
  
  hcolb=$(echo $line|cut -d "," -f 2)
  hcolc=$(echo $line|cut -d "," -f 3)
  hcold=$(echo $line|cut -d "," -f 4)
  hcole=$(echo $line|cut -d "," -f 5)
  hcolf=$(echo $line|cut -d "," -f 6)
  hcolg=$(echo $line|cut -d "," -f 7)
  hcolh=$(echo $line|cut -d "," -f 8)
  hcoli=$(echo $line|cut -d "," -f 9)
  hcolj=$(echo $line|cut -d "," -f 10)
  hcolk=$(echo $line|cut -d "," -f 11)
  hcoll=$(echo $line|cut -d "," -f 12)
  hcolm=$(echo $line|cut -d "," -f 13)
  htotal=$(echo $line|cut -d "," -f 14)

# line 2 max marks
line=$(head -2 $fn|tail -1) 
  tname=$(echo $line|cut -d "," -f 1)
  
  tcolb=$(echo $line|cut -d "," -f 2)
  tcolc=$(echo $line|cut -d "," -f 3)
  tcold=$(echo $line|cut -d "," -f 4)
  tcole=$(echo $line|cut -d "," -f 5)
  tcolf=$(echo $line|cut -d "," -f 6)
  tcolg=$(echo $line|cut -d "," -f 7)
  tcolh=$(echo $line|cut -d "," -f 8)
  tcoli=$(echo $line|cut -d "," -f 9)
  tcolj=$(echo $line|cut -d "," -f 10)
  tcolk=$(echo $line|cut -d "," -f 11)
  tcoll=$(echo $line|cut -d "," -f 12)
  tcolm=$(echo $line|cut -d "," -f 13)
  ttotal=$(echo $line|cut -d "," -f 14)
 
for line in $(cat $fn) ; do
  let count++
  #echo $count
  name=$(echo $line|cut -d "," -f 1)
  
  if [[ $count -gt 2 ]] && [[ $name != "" ]] ; then
 
  colb=$(echo $line|cut -d "," -f 2)
  colc=$(echo $line|cut -d "," -f 3)
  cold=$(echo $line|cut -d "," -f 4)
  cole=$(echo $line|cut -d "," -f 5)
  colf=$(echo $line|cut -d "," -f 6)
  colg=$(echo $line|cut -d "," -f 7)
  colh=$(echo $line|cut -d "," -f 8)
  coli=$(echo $line|cut -d "," -f 9)
  colj=$(echo $line|cut -d "," -f 10)
  colk=$(echo $line|cut -d "," -f 11)
  coll=$(echo $line|cut -d "," -f 12)
  colm=$(echo $line|cut -d "," -f 13)
  total=$(echo $line|cut -d "," -f 14)

  # print for each 
  echo "=============================================="
  echo "360-420-DW Prog for Sci & Engr Assign 1 - 2018"
  echo "Submitted by  " $name
  echo

  echo -e $hcolb "\t" $colb / $tcolb
  echo -e $hcolc "\t" $colc / $tcolc
  echo -e $hcold "\t" $cold / $tcold
  echo -e $hcole "\t" $cole / $tcole
  echo -e $hcolf "\t" $colf / $tcolf
  echo -e $hcolg "\t" $colg / $tcolg
  echo -e $hcolh "\t" $colh / $tcolh
  echo -e $hcoli "\t" $coli / $tcoli
  
  # not using these columns
  #echo -e $hcolj "\t" $colj / $tcolj
  #echo -e $hcolk "\t" $colk / $tcolk
  #echo -e $hcoll "\t" $coll / $tcoll
  #echo -e $hcolm "\t" $colm / $tcolm
 
  #echo -e $htotal "\t" $total / $ttotal
  echo ; echo
  fi
done
