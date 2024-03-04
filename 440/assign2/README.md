### assignment 2 2024
* [instructions](https://docs.google.com/document/d/1eQRmO1WlkuGOQiQ6i5Yq4cQcVWZHMWz5rPGP6hXDGwQ/edit)

#### preliminary (check & nudge if they didn't work on it
run 
1. [modteacher.sh](modteacher.sh)  add teacher uid to supl group docker on student vms
2. [cka2setup.sh](cka2setup.sh)  checks if docker is installed & runs docker ps 

I redirect the results of cka2setup into a file named `results*` then use [whohas.sh](whohas.sh) type greps to check it

#### scripts for  student VMs 

* [cp-scripts.sh](cp-scripts.sh) copies a2-*.sh to student VMs
* [a2-run.sh](a2-run.sh) copies a2-check-container.sh to container then runs the script on the container
* [a2-check-container.sh](a2-check-container.sh) verifies results on the container

