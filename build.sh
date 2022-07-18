#/bin/sh

for dir in $(ls -d */); do
    tag=$(echo $dir | cut -d"/" -f1)
    cd $dir
    docker build . -t ansible-playbook:$tag
    docker push ansible-playbook:$tag
    cd ..
done

docker tag ansible-playbook:alpine3 ansible-playbook:latest
