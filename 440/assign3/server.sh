#!/bin/bash
# pmcampbell
# 2021-04-14
#
# assignment  4 check if dns is up and firewall allows
# do some name resolution


echo ----hostname
hostname
echo ----netstat
# echo password (-S take password from stdin)
echo linuxyay! |sudo -S netstat -plan4 |grep 53 || echo linuxrocks+ |sudo -S netstat -plan4 |grep 53 
echo ----ufw
echo linuxyay! |sudo -S ufw status verbose || echo linuxrocks+ |sudo -S ufw status verbose 
echo "command: dig tricia.$domain"
# coppied from teacher's machine should contain
# domain=domain.ca
# server=server
. arg.server
dig teacher.$domain
dig +noall +answer tricia.$domain
dig +noall +answer linux1.$domain
dig +noall +answer $server.$domain
