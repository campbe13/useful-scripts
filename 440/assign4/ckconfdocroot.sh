#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 

# copy a script   & run it on the remote
# this one does the client check
# IMPORTANT file must be space delimited (tab reads only 1st )

if [[ $# -ne  1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo and a file with domain and line as fields 1 \& 2
   exit 1
fi

copyfile=apache.sh
if [[ ! -f $copyfile ]]  ; then
    exit 2
fi
dir=results
if [[ ! -d $dir ]]  ; then
    mkdir $dir
fi

# need the -u 5 for io or it uses stdin & reads only 1st line
# multi args use while
#while read -u 5 -r domain client ; do
#done 5< $1
for client in `cat $1` ; do
    target=$dir/$client
    if [[ ! -d $target ]] ; then
       mkdir -p $target/keys
    fi
    feedback=$target/client-info.txt
    scp $copyfile teacher@$client:~/
    echo "START>>>$client " >$feedback
    ssh teacher@$client ~/$copyfile >> $feedback
    scp teacher@$client:/etc/apache2/sites-available/* $target
    scp teacher@$client:/etc/apache2/tls/* $target/keys 2>$target/keys/key.copy.errors.txt
done
