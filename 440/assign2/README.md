#### assignment 2 2024
* [instructions](https://docs.google.com/document/d/1eQRmO1WlkuGOQiQ6i5Yq4cQcVWZHMWz5rPGP6hXDGwQ/edit)


run 
1. [modteacher.sh](modteacher.sh)  add teacher uid to supl group docker on student vms
2. [cka2setup.sh](cka2setup.sh)  checks if docker is installed & runs docker ps 

I redirect the results of cka2setup into a file then use [whohas.sh](whohas.sh) type greps to check it