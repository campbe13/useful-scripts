#!/bin/bash
# clone all repos from an organization
# github 

command -v jq >/dev/null
if [[ $? -ne 0 ]] ; then  
   echo $(basename $0)  you must install jq first
   exit 5
fi
source org.access_token
curl -s https://$ACCESS_TOKEN:@api.github.com/orgs/$ORG/repos?per_page=200 | jq .[].ssh_url | xargs -n 1 git clone

#curl --header "PRIVATE-TOKEN: $ACCESS_TOKEN" "https://gitlab.com/api/v4/groups/$ORG/projects" | sed 's/,/\'$'\n''/g' | grep -e 'ssh_url_to_repo*' | cut -d \" -f 4  | xargs -L1 git clone

