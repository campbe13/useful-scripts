#!/bin/bash
# clone all repost gitlab
# pcampbell

# uses gitlab api

#  you can use curl --header "PRIVATE-TOKEN: <your token> " "https://gitlab.com/api/v4/namespaces"  to list all
# run without options to test
# run with option -clone to do the cloning

# you need to get
#  0 group number via the web interface
#  1 an api token via the web interface
#  2  the id of your group/namespace
# add them to the file token.and.groupid, see example:
#gn=group-name
#token=swdMqb3-xxx_7zVsCP6c
#groupid=1234567

# check if jq installed
test ! $(which jq) && echo jq must be installed 1>&2 && exit 1
bn=$(basename $0)

# get the unique information
tokenfn=token.and.groupid

if [[ ! -f $tokenfn ]] ; then
    echo $bn missing file $tokenfn
    echo $tokenfn must contain:
    echo gn=\[group name\]
    echo token=\[your api token via web interface\]
    echo groupid=\[groupid vi web interface\]
    exit 2
fi

source $tokenfn

echo -e "$bn clone everything in group $gn \n"

if [[ "$1" != -clone ]] ; then
	echo NOTE running in test mode \(echo, not git\)
	echo -e 'NOTE to run & clone use option -clone\n'
else
   eval `ssh-agent -s`
   ssh-add ~/.ssh/id_rsa
fi
for repo in $( curl -H "Content-Type:application/json" https://gitlab.com/api/v4/groups/$gn/projects?private_token=$token \
    | tee $gn.json | jq '.[] | .ssh_url_to_repo' |sed s/\"$// |sed s/^\"//|tee $gn.repo.list.txt) ; do
    if [[ "$1" == -clone ]] ; then
        git clone $repo
    else
    	echo git clone $repo
    fi
done
#    -d "{ \"name\": \"$repo\", \"namespace_id\": \"$groupid\"}"
echo -e "\n\n$bn you have the json for the group  in $gn.json"
echo $bn the list of repos is in $gn.repo.list.txt
