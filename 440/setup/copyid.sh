#!/bin/bash
# distribute ssh keys, after install lab
# 420-241-dw OS I intro to linux
# pmc & mg
# 2017-02-20
# modified to use sshpass
# must be installed 
# 2022-02-10

USERNAME=teacher
echo you must cache the keys from the remote host in order to run this w/o interaction
echo run getsshkeys.sh first this will get the remote pubkeys \& you can run this after

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

if [[ ! -f .sshpassword ]] ; then
   echo $(basename $0) need a file .sshpassword to use with sshpass
   exit 1
fi

which sshpass 2&1>/dev/null
if [[ $? -ne 0  ]] ; then
   echo $(basename $0)  sshpass is not installed / in the path
   exit 1
fi


for host in $(cat $1)					
do
  #   distribute the ssh key to avoid typing passwords. 
  echo $host
  sshpass -f.sshpassword ssh-copy-id ${USERNAME}@${host}
done
