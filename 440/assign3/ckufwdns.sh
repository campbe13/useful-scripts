#!/bin/bash
# pmcampbell
# 2021-04-14
#
# assignment  4 check if dns is up and firewall allows


echo ----hostname
hostname
echo ----netstat
# echo password (-S take password from stdin)
echo linuxyay! |sudo -S netstat -plan4 |grep 53 
#echo linuxrocks2022 |sudo -S netstat -plan4 |grep 53 
echo ----ufw
echo linuxrocks |sudo -S ufw status 
#echo linuxrocks2022 |sudo -S ufw status 
echo "command: dig tricia.$domain"
dig teacher.$domain
dig tricia.$domain
dig linux1.$domain
