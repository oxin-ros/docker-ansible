# pull base image
#FROM amidos/dcind
FROM docker:20.10



RUN echo "===> Installing sudo to emulate normal OS behavior..."  && \
    apk --update --no-cache add sudo                              && \
    \
    \
    echo "===> Adding Python runtime..."                                && \
    apk --update  --no-cache add curl py-pip openssl ca-certificates    && \
    apk --update  --no-cache add --virtual build-dependencies \
                libffi-dev openssl-dev build-base python3-dev python3   && \
    pip3 install --upgrade pip                                           && \
    \
    \
    echo "===> Installing Ansible..."           && \
    pip install 'ansible==2.9.6'                && \
    \
    \
    echo "===> Installing handy tools (not absolutely required)..."  && \
    pip install --upgrade pycrypto pywinrm docker                    && \
    apk --update --no-cache add sshpass openssh-client rsync         && \
    curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    \
    \
    echo "===> Removing package list..."  && \
    apk del build-dependencies            && \
    rm -rf /var/cache/apk/*               && \
    \
    \
    echo "===> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible                        && \
    echo 'localhost' > /etc/ansible/hosts 


# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
