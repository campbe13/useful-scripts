#!/bin/bash
# put your token in .token as token=XXXXX
# ommitted from git
# 
# 2019-09-04
# https://forum.gitlab.com/t/create-a-new-project-in-a-group-using-api/1552/5

source .token 

which jq >/dev/null
if [[ $? -eq 0 ]] ; then
 curl --header "PRIVATE-TOKEN: $token" "https://gitlab.com/api/v4/namespaces" | jq
else 
 echo " install jq, it's easier to read"
 curl --header "PRIVATE-TOKEN: $token" "https://gitlab.com/api/v4/namespaces" 
 echo " install jq, it's easier to read"
fi

