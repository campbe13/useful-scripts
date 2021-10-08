# general usage, check the directory for the scripts named if they are not linked here
## script to use ascii cineman
ac.ss
## used to convert csv to html for student feedback
I use google spreadsheets to collect student evaluations of assignments then run
the scripts to create html & give them feedback it's essentially a transpose to html
* [input csv with 2 row header info](assess.2row.py)
* [input csv with 3 row header info](assess.3row.py)
## gave DD a list of students and email addresses from moodle
he created accounts for everyone & gave it back with account name and password
the below script will email the info from the csv to the student
provided an SMTP relay is configured and mail is installed

in general internal servers are allowed to send mail to dawsoncollege.qc.ca

* [script](email-account-info.sh)
* [test csv file](test.csv)
## some example rsync scripts, see directory
syncboth.sh
synctohp.sh
## change file directory names, moodle has spaces everywhere, see directory
underscoretospace.sh
spacetounderscore.sh
