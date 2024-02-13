#!/bin/bash
# pmcampbell
# 2024-02-13
# given a list of hosts, 
#  run a command on a host
# check for docker installed 
# check for container running


echo " you may want to redirect stderr & stdtout to file reminder \&> result.file"

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi


countok=0
countbad=0
# multi args use while
#while read -r i domain server client ; do
#done < $1
# single host name in file, use for
 for i in  `cat $1` ; do
    if [[ $i =~ ^# ]] ; then
       echo comment $i
       continue
    fi
    echo -e "START>>>$i  "
    ssh teacher@$i "which docker && ( echo "docker installed"; docker ps -a; docker images ) || ( echo "docker MISSING" )"
#    ssh teacher@$i "docker ps -a ; docker images" 
#    ssh teacher@$i docker ps -a  
#    ssh teacher@$i docker images  
done

