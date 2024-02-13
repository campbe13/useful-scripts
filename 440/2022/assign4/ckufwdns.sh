#!/bin/bash
# pmcampbell
# 2021-04-14
#
# assignment  4 check if dns is up and firewall allows

echo ----hostname
hostname
echo ----netstat
echo tricia |sudo -S netstat -plan4 |grep 53 
echo ----ufw
echo tricia |sudo -S ufw status 
