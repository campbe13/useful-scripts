#!/bin/bash
# pmcampbell
# 2021-04-08
#
# assignment  4 dns

echo dns server
echo ----hostname
hostnamectl
echo ----resolv.conf
cat /etc/resolv.conf |grep -v "^#"
echo ----netstat
echo tricia |sudo -S netstat -plan64 |grep 53 |grep -v 5353
