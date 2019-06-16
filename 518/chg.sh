#!/bin/bash
# change api versions in
# project level build gradle
#  app/build.gradle 

# 2019-05-15

sed -i -e '/minSdkVersion/  s/minSdkVersion .*/minSdkVersion 22/' $1
sed -i -e '/compileSdkVersion/  s/compileSdkVersion .*/compileSdkVersion 29/' $1
sed -i -e '/targetSdkVersion/  s/targetSdkVersion .*/targetSdkVersion 29/' $1
sed -i -e '/buildToolsVersion/  s/buildToolsVersion .*/buildToolsVersion 29.0.0/' $1
