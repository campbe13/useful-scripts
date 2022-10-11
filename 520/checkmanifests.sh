#!/bin/bash

# check manifests for typos (ru  manually before push)
countcomment=0
countblank=0
ctmissing=0
ctexists=0
curr=$(basename $(pwd))
if [[ $curr != tools ]] ; then
    echo "must be run from tools directory"
    exit 1
fi   

readfile  () {
  if [[ ! -f $1 ]] ; then
    echo $1 does not exist 
    return 1
  fi
while IFS=, read -ra fn1; do
   pwd=$(pwd)
   wholefn=$pwd/$fn
   # remove whitespace
   fn="$(echo -e "${fn1}" | tr -d '[:space:]')"
   if [[ $fn =~ "#" ]] ; then 
      #echo skipped comment $fn
      ((countcomment++)) 
   #elif [[ $fn =~ ^[[:space:]]$ ]] ; then
   elif  [[ $fn == '' ]] ; then
      #echo skipped blank $fn
      ((countblank++))
   elif [[ -e $fn ]] ; then 
        #echo "exists $fn" 
        ((ctexists++))
   else 
        echo "missing  $fn " 
        ((ctmissing++))
   fi
   done < $1   
}
cd ..
echo checking .manifest
readfile .manifest
echo checking .pubhtml_manifest
readfile .pubhtml_manifest
cd - > /dev/null
echo blank lines $countblank
echo comments $countcomment
if [[ $ctmissing == 0 ]] ; then 
    echo manifests match the dir tree, success!
else
    echo MISSING $ctmissing files FIX FIX 
fi