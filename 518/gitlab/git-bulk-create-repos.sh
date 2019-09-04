#!/bin/sh
# create repos on gitlab, using my api private_token
# input a file that contains list of files
# pcampbell

# uses gitlab api

# you need to get 
#  1 an api token via the web interface
#token=< your token >
source .token

#  2  the id of your group/namespace
#  you can use curl --header "PRIVATE-TOKEN: <your token> " "https://gitlab.com/api/v4/namespaces"  to list all 
#groupid=< your group id > 
source .groupid

repofn=$1
groupname="Android518-2019"

test ! -f $repofn && echo "Repo file required." 1>&2 && exit 1
for repo in $(cat $repofn) ; do
  echo "Repo: " $repo
  curl -H "Content-Type:application/json" https://gitlab.com/api/v4/projects?private_token=$token  \
    -d "{ \"name\": \"$repo\", \"namespace_id\": \"$groupid\"}" | jq
done
