# set up func & alias on my box					
# append to .bashrc
myssh() { ssh ${USER}@$1 ;  }					
alias ss=myssh					
