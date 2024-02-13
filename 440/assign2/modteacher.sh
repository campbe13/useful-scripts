#!/bin/bash
# pmcampbell
# 2024-02-13
# given a list of hosts, 
#  run a command on a host
# check for docker installed 
# check for container running

if [[ $# < 1 ]] || [[ ! -e .sshpassword ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo and the remote password in .sshpassword

   exit 1
fi


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
    password=$(cat .sshpassword) 
    ssh teacher@$i  "echo $password |sudo -S usermod -aG docker teacher;echo;id teacher"
done
