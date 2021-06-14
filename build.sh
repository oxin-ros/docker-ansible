#/bin/sh

#for dir in $(ls -d */); do 
#    tag=$(echo $dir | cut -d"/" -f1)
#    cd $dir 
#    docker build . -t $1/ansible:$tag
#    docker push $1/ansible:$tag 
#done

tag=ubuntu20.04
cd ubuntu20.04/ 
docker build . -t $1/ansible:$tag
docker push $1/ansible:$tag

docker tag $1/ansible:ubuntu20.04 $1/ansible:latest
docker tag $1/ansible:ubuntu20.04 $1/ansible:ubuntu20.04-1
docker push $1/ansible:ubuntu20.04-1
docker push $1/ansible:latest

