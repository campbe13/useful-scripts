#!/bin/bash
# change gradle version in top level build.gradle file

# 2019-06-15

sed -i -e '/com.android.tools.build:gradle:/  s/android.tools.build:gradle:.*/com.android.tools.build:gradle:3.4.1/' $1

