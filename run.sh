DOW=$(date +%A)
[[ ! -d $DOW ]] && mkdir $DOW;

for repo in $(gh repo list -L9999 | awk '{print $1}')
do
    dir=$DOW/$(basename $repo)
    rm $dir -rf
    gh repo clone $repo $dir
    [[ ! -d $dir ]] && {
        echo Could not clone into $dir. Aborting...
        exit;
    }
    sleep 5;
done
