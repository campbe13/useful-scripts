#!/bin/bash
# script to check work on the container
# copied to & run on student container


echo student $(hostnamectl --static) 

# ticket 1 

# manually check ssh
# su to user  (if root)
# check history 
#     systemctl check running /  enabled / disabled  or use ps
#     systemctl enable ssh

# ticket 2  (bonus if they verify ??)
apt search audacity  
# or
apt list |grep audacity
# ticket 3
# The first field is the user's loginname. 
# The second field indicates if the user account has a locked password (L), has no password (NP), or has a usable password (P). 
# The third field gives the date of the last password change. 
# 4 minimum age,
# 5 maximum age, 
# 6 warning period, 
# 7  inactivity period for the password.
# These ages are expressed in days.
# result of -S:   bruno L 01/29/2023 0 99999 7 -1
sudo passwd -S bruno  
# ticket 4 
# passwd changed & expired:  01/01/1970 
# result of -S elena P 01/01/1970 0 99999 7 -1
# passwd -e or usermod 
sudo passwd -S elena
# ticket 5
# s/sam/samira/
# usermod samira -l sam
# groupmod -n sam samira
# usermod  sam -d /home/sam -m
grep sam /etc/group /etc/passwd  # groupmod -n sam samira changed
ls -la /home/sam # no samira
# ticket 6
passwd -aS  |egrep "(ozz|rov|erm)"
#fozzie P 02/14/2024 0 7 7 -1
#grover P 02/14/2024 0 7 7 -1
#kermit P 02/23/2024 0 7 7 -1
egrep "(ozz|rov|erm)"  /etc/group
#student:x:1000:andrew,dirk,ally,bruno,carlos,deanne,elena,ellie,sam,fozzie,grover,kermit,trix
#fozzie:x:1013:
#grover:x:1014:
#kermit:x:1015:
#muppets:x:1016:kermit,fozzie,grover

#ticket 7 
ls -la /muppets_share
ls -la /muppets_share/* 

#ticket 8
egrep "(tricia|dirk)" /etc/sudoers
#tricia ALL=(ALL) /usr/bin/apt /usr/bin/apt-get
#dirk ALL=(ALL) /usr/bin/apt /usr/bin/apt-get
a
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A

