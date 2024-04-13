#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 
# copy a script   & run it on the remote

if [[ $# -ne 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo file contains domain and server as fields 1 and 2
   exit 1
fi


copyfile=server.sh
if [[ ! -f $copyfile ]]  ; then
    exit 2
fi
if [[  ! -d fbassig3 ]] ; then
    mkdir fbassig3
fi
   
# domain.ca  hostname
while read  -u 5 -r domain server ; do 
#for i in  `cat $1` ; do
#    if [[ $i =~ ^# ]] ; then
#       echo comment $i
#       continue
#    fi
    echo domain $domain
    echo "domain=$domain" > arg.server
    echo server  $server
    echo "server=$server" >> arg.server
    if [[ ! -d fbassig3/$domain  ]] ; then 
	mkdir fbassig3/$domain
    fi
    fbdir=fbassig3/$domain
    feedback=fbassig3/$domain/server-host-$server.txt
    scp $copyfile arg.server  $server:~/
    echo "START>>> domain $domain server $server" >$feedback
    ssh $server  ~/$copyfile >> $feedback
    if [[ ! -d $fbdir/server ]] ; then
        mkdir $fbdir/server
    fi
    scp $server:/etc/hosts $fbdir/server/
    scp $server:/etc/dnsmasq.conf $fbdir/server/

    #echo server $server 
    #echo feedback $feedback 
done 5< $1
