#/bin/sh

for dir in $(ls -d */); do 
    tag=$(echo $dir | cut -d"/" -f1)
    cd $dir 
    docker build . -t $1/ansible:$tag
    docker push $1/ansible:$tag 
    cd ..
done

docker tag $1/ansible:ubuntu20.04-pip $1/ansible:latest
docker push $1/ansible:latest

