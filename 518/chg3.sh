#!/bin/bash
# changed plugin version to 3.4.1 see chg2.sh
# corresponds to gradle version 5.1.1
# https://developer.android.com/studio/releases/gradle-plugin

# 2019-06-15

sed -i -e '/distributionUrl/  s/distributionUrl.*/distributionUrl=https:\/\/services.gradle.org\/distributions\/gradle-5.1.1-all.zip/' $1

