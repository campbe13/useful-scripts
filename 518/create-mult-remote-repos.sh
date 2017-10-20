#!/bin/bash
#
# p.m.campbell
#
# 2017-09-24
# create multiple repos in an organization on github.com
#
# see https://developer.github.com/v3/repos/#create
# api for user: https://api.github.com/user/repos

# 2017-10-20
# Change: use password properly instead of each time
#    not excactly secure but quick
# Change:  mods to set everything so I don't have to enter
#

echo $(basename $0)
result="result.$(date +%F)"
echo > $result

if [[ $# -ge 1 ]] && [[ $1 == "tricia" ]] ; then
    # user:password
    uid=campbe13
    pass=password
    org=Android518-2017
    repo=assign2-team
    desc="base code for assignment 2 droid 2017"

else
  read -p "enter your github userid " uid
  read -p "enter your github password " pass
  read -p "enter your github organization " org
  read -p "enter your repo basename " repo
  # read -p "enter \# repos you want " count
  read -p "enter description for repo " desc
fi

for i in {01..18} ; do
#for i in {1..$count} ; do
#for i in {3 ; do
  repos=$repo$i
  echo -e "Repo $repos" >> $result
  curl -u $uid:$pass  https://api.github.com/orgs/$org/repos \
   --request POST \
   -d "{\"name\":\"$repos\", \"description\":\"$desc\", \"private\":\"true\"}" \
   >>  $result
  echo -e "================" >> $result
done

echo results are in $result
