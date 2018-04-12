#!/bin/bash
# using $RANDOM to blink an led
# $RANDOM range is 0-32767
# 
# http://wiki.pcampbell.profweb.ca/index.php?title=Misc_fun_stuff
#
# blink an led a random number of times, max  10 times

if [[ $USER != root ]] ; then
   echo $0 must be run as root
   exit 1
fi

# differs depending on your system, check /sys/class/leds
led=/sys/class/leds/input4::numlock

# random number from 1-10
rand=$(($RANDOM%10+1))
echo Blinking $rand times

while [[ $rand -ge 1 ]] ; do
    # on
    echo 1 >  $led/brightness
    sleep 1
    # off
    echo 0 >  $led/brightness
    sleep 1
    (( rand-- ))
done
