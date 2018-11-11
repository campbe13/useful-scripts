#!/bin/bash
# pmcampbell
# examples of my favourite rsyncs
# this one syncs both ways 
# keeps updates from both sides
# nice short man page for ref & has another for all options
# https://ss64.com/bash/rsync.html

# rsync options
# -v verbose
# --stats
# --progress
# -n dry run
# -p preserve permissions
# -r recurse
# -t sync time
# -c skip based on checksum not mod time and size
# -z compress during transfer
# -u update, skip if dest file exists and  is newer

# could use 
#rsync -azn --stats --progress assign1/  tricia@192.168.0.181:~/
# -a archive mode equals -rlptgoD (no -H,-A,-X)
# -l copy symlinks as symlinks  
# -g preserve group
# -o preserve owner 
# -D preserve devices
# -H preserve hard links
# -A 
# -X
if [[ $# == 0 ]] ; then
  # sync both ways  so updates on either are shared
  rsync -vrtcpunz --stats --progress assign1/  tricia@192.168.0.181:~/
  rsync -vrtcpunz --stats --progress   tricia@192.168.0.181:~/ assign1/
else
  read -p "about to rsync, cancel if you made a mistake"
  rsync -vrtcupz --stats --progress assign1/  tricia@192.168.0.181:~/
  rsync -vrtcpuz --stats --progress   tricia@192.168.0.181:~/ assign1/
fi
