#!/bin/bash
# move to the appropriate directory
# for moodle
# 2021-05-02
for i in *.html ; do
     
   name=$(echo $i |cut -d '-'  -f1)
   mv $i $name*/

done
