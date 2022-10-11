#!/bin/bash
# gen reveal slide show from md 
# uses pandoc & revealjs
# assumes ./revealjs/
# assumes pandoc installed
# 2022-08-17
# pmc
if [[ $# -ne 2 ]] ; then
    echo usage $(basename $0)   xyz.md xyz.html# will gen xyz.html
    exit 1
    fi
if [[ ! -f $1 ]]  ; then
    echo $1 does NOT exist, cannot run
    exit 2
    fi
if [[ -f $2 ]]  ; then
    echo $2 exists, will not clobber
    exit  3
    fi
pandoc -t revealjs -V theme=simple -V center=0 -V transition=none \
  -s $1  -o $2 
### debugging
#pandoc --verbose -t revealjs -V theme=simple -V center=0 -V transition=none \
#  -s $1  -o $2  --log=pandoc.log
