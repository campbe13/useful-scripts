#!/bin/bash
# retrieve assignment 3
# from student's   /home/userid/www/$dir
# javascript fall 2020
# pmcampbell

sect2=~/scripts/320-js-class-tricia-sect02.txt
sect1=~/scripts/320-js-class-jaya-sect01.txt
dir=ass3
file=$sect2
teacher=tricia
found=0
missing=0
date=$(date +%F)
usage () {
    echo $(basename $0) 1 '|' 2
    echo section 1 jaya, section 2 tricia
}
if [[ $# -ne 1 ]] ; then 
     usage
     exit 2
elif [[ $1 -eq 1 ]] ; then 
     file=$sect1
     teacher=jaya
elif [[ $1 -ne 2 ]] ; then 
    usage
    exit 2
fi
errorfile=~/scripts/errors-$teacher-$date.txt
tmp=/tmp/$dir-$teacher-$date
mkdir $tmp 
for i in $(cat $file) ; do
     if [[ ! -d /home/$i/www/$dir ]] ; then
           echo $i no /home/$i/www/$dir |tee -a $errorfile
	   ((missing++))
     else 
           mkdir $tmp/$i 2>/dev/null
           cp -R /home/$i/www/$dir $tmp/$i/ 
	   ((found++))
     fi
done
tar -czf /tmp/$dir-$teacher-$date.tgz  $tmp
echo Totals for teacher $teacher |tee -a $errorfile
echo students $(wc $file -l) |tee -a $errorfile

echo $dir found $found |tee -a $errorfile
echo $dir missing $missing |tee -a $errorfile
echo see /tmp/$dir-$teacher-$date.tgz | tee -a $errorfile

if [[ $teacher == "jaya" ]] ; then
    email="jnilakantan@dawsoncollege.qc.ca"
else
    email="pcampbell@dawsoncollege.qc.ca"
fi
cat $errorfile | mail -s "results cronjob $dir cat" $email 
rm -rf $tmp
