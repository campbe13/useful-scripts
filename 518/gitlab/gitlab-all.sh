ORG=Android518-2018
ACCESS_TOKEN=u-gz8ZVNz592s8D-QetW
curl --header "PRIVATE-TOKEN: $ACCESS_TOKEN" "https://gitlab.com/api/v4/groups/$ORG/projects" | sed 's/,/\'$'\n''/g' | grep -e 'ssh_url_to_repo*' | cut -d \" -f 4  | xargs -L1 git clone

