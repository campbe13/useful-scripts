#!/bin/bash
# pmcampbell
# 2021-03-12
#
# lab 2

echo id
id jimh;id gonzo;id fozzie; id kermit
ls -l /usr/local/muppetmovie2021
ls -ld /usr/local/muppetmovie2021
echo tricia |sudo -S ls -ld /usr/local/muppetmovie2021
#echo tricia |sudo -S grep  jimh /etc/passwd /etc/group /etc/shadow
sudo  grep  jimh /etc/passwd /etc/group /etc/shadow
