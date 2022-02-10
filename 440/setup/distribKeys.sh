#!/bin/bash
# distribute ssh keys, after install lab
# 420-241-dw OS I intro to linux
# pmc & mg
# 2017-02-20
# modified to use sshpass
# must be installed 
# 2022-02-10

USERNAME=tricia

if [[ ! -f $1 ]] ; then
  echo $(basename $0) we need a file argument 1 with the name of a desktop to test
  exit 1
fi

for host in $(cat $1)					
do
  #   distribute the ssh key to avoid typing passwords. 
  ssh-copy-id ${USERNAME}@${host}
done
