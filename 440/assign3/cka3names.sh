#!/bin/bash
# pmcampbell
# 2021-01-12
# given an input file with domain.ca pa
#  muppets.ca kermit fozzie
# use the dns config'd locally for the domain (see my dnsmasq.conf server=/domain/ip
# IMPORTANT file must be space delimited (tab reads only 1st )

if [[ $# -ne  1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo and a file with domain and line as fields 1 \& 2
   exit 1
fi
if [[ ! -d fbassig3 ]] ; then
   mkdir fbassig3
fi

# need the -u 5 for io or it uses stdin & reads only 1st line
# multi args use while
while read -u 5 -r domain partner1 partner2 ; do
    if [[ ! -d fbassig3/$domain ]] ; then 
        mkdir fbassig3/$domain
    fi
    fn=fbassig3/$domain/server.lookups.via.server
    echo "domain=$domain for $partner1 and $partner2"
    dig +noall +answer @localhost linux1.$domain > $fn
    dig +noall +answer  @localhost teacher.$domain >> $fn
    dig +noall +answer  @localhost $partner1.$domain >> $fn
    dig +noall +answer  @localhost $partner2.$domain >> $fn
done 5< $1
