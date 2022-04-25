while read -r dns domain server client ; do
    echo $dns.$domain
    echo $domain
    echo $server.$domain
    echo $client.$domain
done < $1

