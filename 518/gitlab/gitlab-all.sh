#!/bin/bash
# clone all repos from an organization
# gitlab 
# if you have more than 100 projects change the page count

source org.access_token

curl --header "PRIVATE-TOKEN: $ACCESS_TOKEN" "https://gitlab.com/api/v4/groups/$ORG/projectss?per_page=100" | sed 's/,/\'$'\n''/g' | grep -e 'ssh_url_to_repo*' | cut -d \" -f 4  | xargs -L1 git clone

