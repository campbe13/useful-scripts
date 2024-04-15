#!/bin/bash
# pmcampbell
# 2021-04-14
#
# assignment  4 check if client can resolv
# args.client contains 
#domain=xyz.ca
. args.client
echo ----hostname
hostname
echo --resolv.conf
#tail /etc/resolv.conf
cat  /etc/resolv.conf |grep -v "^#"
echo ----NetworkManager.conf
grep -A 5 main  /etc/NetworkManager/NetworkManager.conf 
echo ----dns
echo "command: dig tricia.$domain"
dig  teacher.$domain
dig +noall +answer  tricia.$domain
dig +noall +answer  linux1.$domain
dig +noall +answer  sonic.$domain
dig +noall +answer  $client.$domain
