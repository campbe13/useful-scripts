#!/bin/bash
# pmcampbell
# 2021-03-12
#
# lab 2

echo hostname
hostnamectl
echo own userid \& tricia
grep -A 5 dawson  /etc/passwd
echo sudo for both 
grep sudo /etc/group
id tricia
echo enabled
systemctl status ssh |grep enabled
echo install asciiquarium
which asciiquarium
echo install git, dos2unix, etc
dpkg -l |grep -w git
dpkg -l |grep dos2unix
dpkg -l |grep cowsay
