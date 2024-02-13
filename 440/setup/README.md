##  teacher's scipts to run after VM setup lab (usually week2)
I usually run this on my VM as I do most of my marking from there

### Distribute teacher keys to student VMs
Note currently userid is teacher 2024 could be changed to any you wish
students were asked to create the userid teacher on their systems
they were given a password to assgin (put that in .sshpassword)

#### prep

1. use the form information submitted after the vm setup to create a hosts file
2. makesure all systems are booted, run [checkup.sh](checkup.sh)  if some are down you need to use the vsphere console to start them or figure out why ssh is not connecting

#### setup 
Run the following on the system you will be using to access student VMs 

1. be sure to gen your own keys (I leave the passphase blank for the purpose of checkin student's work)
2. put teacher password in `.password` (needed for getsshkeys.sh)
1. run [getsshkeys.sh](getsshkeys.sh)  this will cache the keys from  the student vms
   * if you get permission denied on a few they messed up the password
   * if the keys are not cached the next scripts will require interaction 
1. install `sshpass`  on your system
2. put teacher password in `.sshpassword` (needed for copyid.sh)
1. run [copyid.sh](copyid.sh)  copy  teacher keys to list of student VMs edit the script to put in USERNAME

optional --- not working right now and not needed as keys installed
1. run [chgpass.sh](chgpass.sh) to change the password of teacher id, edit the script to put in passwords & USERNAME

## [addto.bashrc](addto.bashrc)
`cat addto.bashrc >> ~/.bashrc`

can use the alias `ss studentname` will use $USER envir var as name (if you want to overide current uid) 
