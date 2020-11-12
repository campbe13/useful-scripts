for i in $(cat list.all.txt) ; do
   if [[ -d $i ]] ; then
      continue
      count++
   fi
   git clone $i
   clonecount++
done
