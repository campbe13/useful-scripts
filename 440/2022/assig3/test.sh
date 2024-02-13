# multi args use while
while read -r i domain server client ; do
    echo $i 
    echo $domain
done < $1
while read -r line ; do
    echo $line 
done < $1

