#!/bin/bash
# script to check work on the container
# run from the student's VM 

# copy script to container
chmod +x a2-check-container.sh
docker cp a2-check-container.sh assignment2:/check.sh

# get into the container
docker exec -it assignment2 "/check.sh"


