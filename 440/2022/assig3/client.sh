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
tail /etc/resolv.conf
echo ----dns
echo "command: dig tricia.$domain"
dig tricia.$domain
echo ret code $?
