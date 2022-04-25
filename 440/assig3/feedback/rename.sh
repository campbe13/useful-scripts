#!/bin/bash
# change names to uppercase on the html files
# for moodle
# 2021-05-02
for i in *.html ; do

   part1=$(echo $i |sed -e 's/^./\U&/')
   part2=$(echo $part1 |sed -e 's/_./\U&/')
   #echo before $i
   #echo after $part2
   mv $i $part2
done
