#!/bin/bash
# script to check work on the container
# copied to & run on student container

pwd
ls -la |grep student
cat .student_name
# ticket 1 

# manually check ssh
# su to user  (if root)
# check history 
#     systemctl check running /  enabled / disabled  or use ps
#     systemctl enable ssh

# ticket 2  (bonus if they verify ??)
#apt search audacity  
# or
echo "ticket 2"
apt list 2>/dev/null|grep audacity 
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
echo "ticket 3"
echo "expect:   bruno L 01/29/2023 0 99999 7 -1"
sudo passwd -S bruno  
# ticket 4 
# passwd changed & expired:  01/01/1970 
# result of -S elena P 01/01/1970 0 99999 7 -1
# passwd -e or usermod 
echo "ticket 4"
echo "expect:  elena P 01/01/1970 0 99999 7 -1"
sudo passwd -S elena
# ticket 5
# s/sam/samira/
# usermod samira -l sam
# groupmod -n sam samira
# usermod  sam -d /home/sam -m
echo "ticket 5 s/samira/sam"
grep -i sam /etc/group /etc/passwd  # groupmod -n sam samira changed
ls -lad /home/[Ss]am # no samira
# ticket 6
echo "ticket 6"
echo expect: userid  P 02/14/2024 0 7 7 -1
passwd -aS  |egrep "(ozz|rov|erm)"
#fozzie P 02/14/2024 0 7 7 -1
#grover P 02/14/2024 0 7 7 -1
#kermit P 02/23/2024 0 7 7 -1
echo 'expect: student (3), 3xgroups, muppets (3)'
egrep "(ozz|rov|erm)"  /etc/group

#student:x:1000:andrew,dirk,ally,bruno,carlos,deanne,elena,ellie,sam,fozzie,grover,kermit,trix
#fozzie:x:1013:
#grover:x:1014:
#kermit:x:1015:
#muppets:x:1016:kermit,fozzie,grover
chage -l fozzie || chage -l Fozzie
chage -l grover || chage -l Grover
chage -l kermit || chage -l Kermit

#ticket 7 
echo "ticket 7"
if [[ ! -e /muppets_share ]] ; then 
    echo "error not at / "
    dir=`find  /home/ -name muppets_share`
    ls -lad $dir
    ls -la $dir 
else
    ls -lad /muppets_share
    ls -la /muppets_share
fi

#ticket 8
echo "ticket 8"
echo "expect trica ALL=(ALL) /usr/bin/apt /usr/bin/apt-get"
egrep "(tricia|dirk)" /etc/sudoers
grep  -i  apt /etc/sudoers
grep  -i  teach /etc/sudoers
sudo su - dirk -c ' apt install cowsay -y'
echo "bonus for user_alias"
#tricia ALL=(ALL) /usr/bin/apt /usr/bin/apt-get
#dirk ALL=(ALL) /usr/bin/apt /usr/bin/apt-get
