#!/bin/bash
# automate group creation and access
#
# list groups
#
# pcampbell
# 2021-10-20
source access.token

tokenstr="PRIVATE-TOKEN: $TOKEN"
echo $tokenstr
curl  --header "$tokenstr"  https://gitlab.com/api/v4/groups/d2192/projects


