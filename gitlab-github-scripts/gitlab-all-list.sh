#!/bin/bash
# clone all repos from an organization
# gitlab 

source org.access_token

curl --header "PRIVATE-TOKEN: $ACCESS_TOKEN" "https://gitlab.com/api/v4/groups/$ORG/projects?per_page=100" | sed 's/,/\'$'\n''/g' |grep ssh | tee all |wc
#curl --header "PRIVATE-TOKEN: $ACCESS_TOKEN" "https://gitlab.com/api/v4/groups/$ORG/projects" | sed 's/,/\'$'\n''/g' | grep -e 'ssh_url_to_repo*' | cut -d \" -f 4  | xargs -L1 git clone

