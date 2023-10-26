#!/bin/bash
# pmc
# pmc
# run after compileDirs.sh 
# cd to each directory & run the class  
#
# go into each dir
# run class file
# results 
class=WebPage
if [[ $# -ne 1 ]] ; then
    echo "Missing class name - single argument"
	exit 1
fi
class=$1

# ls dirs only (delete trailing /)
for i in $(ls -d */| tr -d /)
do
  cd $i
  echo $i------------------------------------
  echo Grover 25000 snails
  printf "%s\n%d\n%s\n" Grover 25000 snails | java $class 
  echo 1 means match
  printf "%s\n%d\n%s\n" Grover 25000 snails | java $class | tr -d | grep -c  "<html><head><title>Grover</title></head><body><h1>Welcome to Grover's Website</h1><p>6 hour(s) 56 minute(s) 40 second(s)</p><p>The best animal is/a snails</p></body></html>"
  echo $i  1432 puppies
  printf "%s\n%d\n%s\n" $i 1432 puppies | java $class 
  echo 1 means match
  cd ..
  printf "%s\n%d\n%s\n" $i 1432 puppies | java $class | grep -c  "<html><head><title>Grover</title></head><body><h1>Welcome to $i's Website</h1><p>0 hour(s) 23 minute(s) 52 second(s)</p><p>The best animal is/a puppies</p></body></html>"
done