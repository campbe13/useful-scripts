## 420-440-DW Infra Linux II
Files w data for the course & scripts for assignments and misc jobs 
### Scripts
#### checkkeys.sh
given a list of hosts, check which are ssh accessible
using the local keys of user tricia
#### checkup.sh
given a list of hosts, check which are up via quiet ping
#### ckapache.sh
given a list of hosts, check which are ssh accessible, students sometimes forget to enable or misconfigure sshd
#### runcmd.sh
given a list of hosts, run this to execute a single command in CMD on a host
expects that you have the ssh keys on the target list
CMD="" will just shell in
