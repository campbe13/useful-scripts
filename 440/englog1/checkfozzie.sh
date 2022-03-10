#!/bin/bash
# pmcampbell
# 2021-03-19
# given a list of hosts, check which are
# configured / set up for userdir tricia

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

echo "checking userdir ~fozzie"
for box in  `cat $1` ; do
    # --connect-timeout 15 added
    echo checking $box >> fozzie.log
    curl -s --connect-timeout 15 $box/~fozzie/ >>  fozzie.log
done
