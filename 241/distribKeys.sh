#!/bin/bash
# distribute ssh keys, after install lab
# 420-241-dw OS I intro to linux
# pmc & mg
# 2017-02-20

USERNAME=tricia

if [[ ! -f hostlist ]] ; then
  echo $(basename $0) we need a file hostlist with the name of a desktop to test
  exit 1
fi

for host in $(cat hostlist)					
do
  #   distribute the ssh key to avoid typing passwords. 
  ssh-copy-id ${USERNAME}@${host}
done
exit
# set up func & alias on my box					
# append to .bashrc
myssh() { ssh ${USER}@$1 ;  }					
alias ss=myssh					
