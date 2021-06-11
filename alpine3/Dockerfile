# Dockerfile for building Ansible image for Alpine 3, with as few additional software as possible.
#
# @see https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md
#
# Version  1.0
#


# pull base image
FROM alpine:3


RUN echo "===> Installing sudo to emulate normal OS behavior..."  && \
    apk --update add sudo                                         && \
    \
    \
    echo "===> Adding Python runtime..."  && \
    apk --update add python3 py3-pip openssl ca-certificates   && \
    apk --update add --virtual build-dependencies \
                python3-dev libffi-dev openssl-dev build-base && \
    pip3 install --upgrade cffi pip                           && \
    \
    \
    echo "===> Installing Ansible..."  && \
    export CRYPTOGRAPHY_DONT_BUILD_RUST=1 \
    pip3 install ansible                && \
    \
    \
    echo "===> Installing handy tools (not absolutely required)..."  && \
    pip3 install --upgrade pycrypto pywinrm  && \
    apk --update add sshpass openssh-client rsync curl git  && \
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
