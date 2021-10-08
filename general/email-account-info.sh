#!/bin/bash
# given a csv from moodle (updated by DD
# email the student their login information

#csv
#first,last,email,account,password
# cut -d ',' -f 1 # first name
# cut -d ',' -f 2 #last name
# cut -d ',' -f 3 email
# cut -d ',' -f4 account id on korra
# cut -d ',' -f 5 password

if [[ $# -eq 0 ]] ||  [[ ! -f $1 ]] ; then
	echo "$(basename $0) requires 1 arg, csv containing"
	echo "first, last, email, account id, password"
	exit
fi
  

for user in $(cat $1) ; do
	
mail -s "320 account information on korra" $(echo $user |cut -d ","  -f 3) << End

This is your account information for korra.dawsoncollege.qc.ca, you will be using it in
the lab next week.  
If you want to you can test it ahead of time by using filezilla or putty to access the system.

Your userid   $(echo $user |cut -d "," -f 4)
Your password $(echo $user | cut -d "," -f 5)

End
echo " sent $user " >> $(date +%F).sent.uids.log
done
