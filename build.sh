#/bin/sh

for dir in $(ls -d */); do 
    tag=$(echo $dir | cut -d"/" -f1)
    cd $dir 
    docker build . -t $1/ansible:$tag
    docker push -t $1/ansible:$tag
done