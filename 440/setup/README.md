##  teacher's scipts to run after VM setup lab (usually week2)

### Distribute teacher keys to student VMs
Note currenhtly userid is teacher 2024 could be changed to any you wish
students were asked to create the userid teacher on their systems
they were given a password to assgin (put that in .sshpassword)

Run the following on the system you will be using to access student VMs 

1. be sure to gen your own keys (I leave the passphase blank for the purpose of checkin student's work)
1. install `sshpass` 
2.  put teacher password in `.sshpassword`
1. run [getsshkeys.sh](getsshkeys.sh)  this will cache the keys for the student vms
   * if you get permission denied on a few they messed up the password 
1. run [copyid.sh](copyid.sh)  copy keys to list of student VMs edit the script to put in USERNAME
1. run [chgpass.sh](chgpass.sh) to change the password of teacher id, edit the script to put in passwords & USERNAME


## [addto.bashrc](addto.bashrc)
`cat addto.bashrc >> ~/.bashrc`

can use the alias `ss studentname` will use $USER envir var as name (if you want to overide current uid) 
