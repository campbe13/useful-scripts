#!/bin/bash
# copy all the paths listed in $manifest to $publish_dir
# re-creating the same directory structure, then
# add the resulting files to the repo in $publish_dir
# Note: .lastcommit is the sha of the last published commit in the origin repo

publish_dir="$(cat .publish_dir)"
manifest=".manifest"
message_prefix=$1
commit_msg_file="$publish_dir/.commitmessage"

function isDirty {
  # return 0 if there are any changes or new untracked files
  local dirty=0
  if git diff --name-status --exit-code; then
    dirty=1  
  else
    return 0
  fi
  local untrackedFiles=$(git ls-files --other --exclude-standard --directory)
  if [[ -n $untrackedFiles ]]; then
    return 0
  fi
  return $dirty
}

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 commit_message_in_quotes"
  exit 1
fi

echo "Deleting all .class files"
find . -name *.class -delete

for p in $(grep -Ev "^#|^$" "$manifest")
do
  cp -rv --parents $p $publish_dir
done

echo
if [[ -a "$commit_msg_file" ]]
then
  rm $commit_msg_file
fi
cd $publish_dir

if isDirty; then 
  git add .
  git status
  cd -
else 
  echo "No changes to commit"
  exit 0
fi

echo -e "$message_prefix\n" > $commit_msg_file
if [[ -a .lastcommit ]]
then
    # record changes since last published commit
    git log $(cat .lastcommit).. --oneline >> $commit_msg_file
fi
cat $commit_msg_file

cd $publish_dir && git commit -m "$(cat .commitmessage)" && git push origin main
cd -
# record last published commit
git rev-parse HEAD > .lastcommit
