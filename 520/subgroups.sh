#!/bin/sh
##set -x

## Prerequisites: git, curl and jq package installed
## 1- create SSH key - see https://docs.gitlab.com/ee/user/ssh.html
## 2- add ssh key from .pub to your GitLab preferences - https://cloudaffaire.com/how-to-add-an-ssh-key-in-your-gitlab-profile/
## 3- get GitLab API token - https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html

## inspired by https://cloudaffaire.com/how-to-add-an-ssh-key-in-your-gitlab-profile/

## input: file with lines containing each student id (used for subgroup) and gitlab username
## separated by a space.
## WARNING: tested on a Windows system, username \r manipulation may not be needed on other systems
## Remove -s and uncomment set -x if you need to debug

## Edit config.sh script with:
## - the group access token - Group > Settings > Access Tokens: token=<group access token>
## - the group id of the parent GitLab for Education group: groupid=< your group id >
## Note: config.sh is added to the .gitignore to prevent accidental push)

source ./config.sh

test ! -f $students && echo "Usage: student id and username file required" && exit 1

while IFS=, read -ra student; do
  line=( $student )
  studentid=${line[0]}
  username=${line[1]}

  ## Create a new subgroup inside your group
  ## GitLab Console => Groups => Your Groups => <YOUR_GROUP_NAME> => New Subgroup
  SUB_GROUP_ID=$(curl --http1.1 -s --request POST --header "PRIVATE-TOKEN: $token" --header "Content-Type: application/json" \
  --data '{"name": "'"$studentid"'", "path": "'"$studentid"'", "description": "subgroup created through api" }' \
  "https://gitlab.com/api/v4/groups?parent_id=$sectiongroupid" | jq '.id')

  ## Optional: Get the details for your subgroup
  ## GitLab Console => Groups => Your Groups => <YOUR_GROUP_NAME> => <YOUR_SUBGROUP_NAME>
  ## curl --http1.1 --request GET --header "PRIVATE-TOKEN: $token" \
  ## "https://gitlab.com/api/v4/groups/$SUB_GROUP_ID" | jq '.'
  
  ## Get the user id of the GitLab user
  ## GitLab Console => Account => Settings => Profile => Main settings => User ID
  url="https://gitlab.com/api/v4/users?username=${username%$'\r'}"
  USER_ID=$(curl --http1.1  --request GET --header "PRIVATE-TOKEN:$token" \
  "$url" | jq '.[].id') && echo $USER_ID

  ## Add user as member to the subgroup with Maintainer role
  ## GitLab Console => Groups => Your Groups => <YOUR_GROUP_NAME> => Members => Invite Members
  curl --http1.1  --request POST --header "PRIVATE-TOKEN:$token" \
  "https://gitlab.com/api/v4/groups/$SUB_GROUP_ID/members?user_id=$USER_ID&access_level=40" | jq '.'

done < $1

## Optional: List all sub-groups inside a group
## GitLab Console => Groups => Your Groups => <YOUR_GROUP_NAME> => <YOUR_SUBGROUP_NAME>
curl --http1.1 --header "PRIVATE-TOKEN: $token" \
-XGET "https://gitlab.com/api/v4/groups/$groupid/subgroups" | jq '.'