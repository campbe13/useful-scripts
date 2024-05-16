#!/bin/bash
# pmcampbell
# 2024-05-12
# given a list of $domain  student1 student2
# build uris to test the content

if [[ $# -ne  1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo and a file with $domain and line as fields 1 \& 2
   exit 1
fi

uris=result.uris.txt

# need the -u 5 for io or it uses stdin & reads only 1st line
# multi args use while
while read -u 5 -r domain partner1 partner2 ; do
    echo "# $domain  " >> $uris
    echo http://$partner1.$domain/  >> $uris
    echo http://$partner1.$domain:8805/  >> $uris
    echo http://$partner1.$domain:8855/  >> $uris
    echo https://$partner1.$domain/  >> $uris
    echo http://$partner2.$domain/  >> $uris
    echo http://$partner2.$domain:8805/  >> $uris
    echo http://$partner2.$domain:8855/  >> $uris
    echo https://$partner2.$domain/  >> $uris
done 5< $1
