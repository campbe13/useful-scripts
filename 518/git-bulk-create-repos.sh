#!/bin/sh
# create repos on github, using my api private_token
# input a file that contains list of files
# pcampbell

# uses gitlab api

# you need to get 
#  1 an api token via the web interface
#  2  the id of your group/namespace
#  you can use curl --header "PRIVATE-TOKEN: <your token> " "https://gitlab.com/api/v4/namespaces"  to list all 



repofn=$1
token=UgpiZi9kChZw7XGLi5Cu
groupid=SETGROUPID
groupname="Android518-2018-staging"

test ! -f $repofn && echo "Repo file required." 1>&2 && exit 1
for repo in $(cat $repofn) ; do
  echo "Repo: " $repo
  curl -H "Content-Type:application/json" https://gitlab.com/api/v4/projects?private_token=$token  \
    -d "{ \"name\": \"$repo\", \"namespace_id\": \"$groupid\"}"
done
