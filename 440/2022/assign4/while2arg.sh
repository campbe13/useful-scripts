while read -r one two ; do
    echo 1 $one
    echo 2 $two
done < $1

