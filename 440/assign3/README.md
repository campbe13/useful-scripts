## Assignment 3 DNS client & server
below server is the host that acted as the server

and 

client is the host that acted as the client

domain is domain chosen by the students

IMPORTANT the  input files for cka3*.sh must be space delimited (will not work if tab delimited)
### cka3server.sh
* cli arg file with 2x fields domain server
* creates an arg.server file containing the domain and server args (sourced in server.sh)
* copies the arg file & server.sh to the server
* runs the file & results in fbassig3/ local host
#### server.sh
* copied to the server & run there 
### cka3server.sh
* cli arg file with 2x fields domain client
* creates an arg.line file containing the domain  (sourced in client.sh)
* copies the arg file & client.sh to the server
* runs the file & results in fbassig3/ local host

#### client.sh
* copied to the client  & run there 
### misc
#### cklinux1.sh
1. set up local dnsmasq with `server=/studentdomain.ca/10.172.\<their IP address\>`
2. run cklinux1.sh uses their dns server  to resolve

#### runcmd.sh
cli arg list of hosts
will run the command in local file `CMD` on the hosts
