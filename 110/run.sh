
if [[ $# -ne 0  &&  $1 -eq "-t" ]] ;  then
    
for class in $(find ./ -name "*.class"|sort)
do
    echo $class
    echo cd $(echo $class  |cut -d \/ -f 2 )
    echo java $(echo $class |sed s/\.class// |cut -d \/ -f 3 )
done
exit
fi
echo "2468:   4028"
echo "9215:   1875"
for class in $(find ./ -name "*.class"|sort)
do
    echo $class
    cd $(echo $class  |cut -d \/ -f 2 )
    classfn=$(echo $class |sed s/\.class// |cut -d \/ -f 3 )
    if [[ -f $classfn.class  ]] ; then 
        printf "%d\n" 2468 | java $(echo $class |sed s/\.class// |cut -d \/ -f 3 )|grep 4028
        printf "%d\n" 9215 | java $(echo $class |sed s/\.class// |cut -d \/ -f 3 )|grep 1875

#        printf "%d\n" 2448 | java $(echo $class |sed s/\.class// |cut -d \/ -f 3 )
#        printf "%d\n" 9215 | java $(echo $class |sed s/\.class// |cut -d \/ -f 3 )
    else
        echo $class extra dir
    fi
    cd -
done
