##  teacher's scipts to run after VM setup lab (usually week2)

### Distribute teacher keys to student VMs
Note currenhtly userid is teacher 2024 could be changed to any you wish
students were asked to create the userid teacher on their systems
they were given a password to assgin (put that in .sshpassword)

teachers will use it for access
1. install sshpass 
2.  put teacher password in `.sshpassword`
1. run [getsshkeys.sh](getsshkeys.sh)  this will cache the keys for the student vms
1. run [copyid.sh](copyid.sh)  copy keys to list of student VMs edit the script to put in USERNAME
1. run [chgpass.sh](chgpass.sh) to change the password of teacher id, edit the script to put in passwords & USERNAME


## [addto.bashrc](addto.bashrc)
`cat addto.bashrc >> ~/.bashrc`

can use the alias `ss studentname` will use $USER envir var as name (if you want to overide current uid) 
