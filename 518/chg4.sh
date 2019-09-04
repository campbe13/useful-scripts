#!/bin/bash
# fix app level build.gradle
#Configuration 'compile' is obsolete and has been replaced with 'implementation' and 'api'
#Configuration 'androidTestCompile' is obsolete and has been replaced with 'androidTestImplementation'
#Configuration 'testCompile' is obsolete and has been replaced with 'testImplementation'
# 2019-07-18

sed -i -e '/compile /  s/compile /implementation /' $1
sed -i -e '/androidTestCompile/  s/androidTestCompile/androidTestImplementation/' $1
sed -i -e '/testCompile/  s/testCompile/testImplementation/' $1

