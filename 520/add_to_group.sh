#!/bin/sh
## set -x

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

## Optional: Get the details for your groups
## GitLab Console => Groups => Your Groups => <YOUR_GROUP_NAME> => <YOUR_SUBGROUP_NAME>
curl --http1.1 --request GET --header "PRIVATE-TOKEN: $token" \
"https://gitlab.com/api/v4/groups/$groupforall" | jq '.'

curl --http1.1 --request GET --header "PRIVATE-TOKEN: $token" \
"https://gitlab.com/api/v4/groups/$groupforstudy" | jq '.'

while IFS=, read -ra student; do
  line=( $student )
  studentid=${line[0]}
  username=${line[1]}
  
  ## Get the user id of the GitLab user
  ## GitLab Console => Account => Settings => Profile => Main settings => User ID
  url="https://gitlab.com/api/v4/users?username=${username%$'\r'}"
  USER_ID=$(curl --http1.1  --request GET --header "PRIVATE-TOKEN:$token" \
  "$url" | jq '.[].id') && echo $USER_ID

  ## Add user as member to the all subgroup with Developer role
  ## GitLab Console => Groups => Your Groups => <YOUR_GROUP_NAME> => Members => Invite Members
  curl --http1.1  --request POST --header "PRIVATE-TOKEN:$token" \
  "https://gitlab.com/api/v4/groups/$groupforall/members?user_id=$USER_ID&access_level=30" | jq '.'

## Add user as member to the study subgroup with Reporter role
  ## GitLab Console => Groups => Your Groups => <YOUR_GROUP_NAME> => Members => Invite Members
  curl --http1.1  --request POST --header "PRIVATE-TOKEN:$token" \
  "https://gitlab.com/api/v4/groups/$groupforstudy/members?user_id=$USER_ID&access_level=20" | jq '.'

done < $1

