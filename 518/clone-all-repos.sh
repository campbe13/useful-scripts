#!/bin/bash
# p campbell
# 2017-09-17 check for ruby before running
# 2016-11-25 created
# 
# clones all repos in an organization or for a userid on github
# uses github api URL
#
# source
# can't remember where I got the info
# you need to install ruby
#
# testing
# I have used it on ubuntu, it works fine for public repos
# I have not used it on a mixed or private only $org
#
# TODO: replace ruby with something more generic to a bash shell to parse the json ??
# TODO: have the org as a param instead of hard coding
# TODO: add user need users/$userid  (org is orgs/$orgname)
fn=$(basename $0)
org=Android18-2017

read -p  "$fn about to clone all repos in org $org y or n" yn

if [[ $yn != y ]] ; then
   echo $fn ending by choice
   exit 1
fi

# check for ruby, assuming curl
which ruby >/dev/null    # n.b. sets return code 1 if not found 0 if found
if [[ $? -eq 1 ]] ; then
   echo  $fn :  ruby is not in path or not installed.
   exit 5
fi

curl -s https://api.github.com/orgs/$org/repos?per_page=200 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["ssh_url"]} ]}'


# clone private repos:
# I have not tested this
#curl -u [[USERNAME]] -s https://api.github.com/orgs/[[ORGANIZATION]]/repos?per_page=200 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["ssh_url"]} ]}'
