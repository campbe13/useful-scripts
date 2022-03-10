#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, check which are ssh accessible

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

for i in  `cat $1` ; do
    run=$(ssh tricia@$i systemctl status apache2 |grep -i active|grep -c running)
    if [[ $run -eq 0 ]] ; then
        echo $i apache2  dead
    else
        echo $i apache2  running
    fi
done
