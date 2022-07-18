# Dockerfile for building Ansible image for Alpine 3, with as few additional software as possible.
#
# @see https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md
#
# Version  1.0
#

# pull base image
ARG BASE_IMAGE=alpine:3
FROM ${BASE_IMAGE}

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
RUN echo "===> Installing sudo to emulate normal OS behavior..." \
    && apk --no-cache add sudo \
    \
    && echo "===> Adding Python runtime..." \
    && apk --no-cache add \
        python3 \
        py3-pip \
        openssl \
        ca-certificates \
    && apk --no-cache add --virtual build-dependencies \
        python3-dev \
        libffi-dev \
        openssl-dev \
        build-base \
    && pip3 install --no-cache-dir --upgrade \
        cffi \
        pip \
        wheel \
    \
    && echo "===> Installing Ansible..." \
    && pip3 install --no-cache-dir ansible \
    \
    && echo "===> Installing system tools..." \
    && pip3 install --no-cache-dir --upgrade \
        pycrypto \
        pywinrm \
    && apk --no-cache add \
        sshpass \
        openssh-client \
        rsync \
        curl \
        git  \
    \
    && echo "===> Removing package list..." \
    && apk del build-dependencies \
    && rm -rf /var/cache/apk/* \
    && rm -rf /root/.cache/ \
    \
    && echo "===> Cearing python cache..." \
    && find /usr/lib/python3.10/ -type d -name __pycache__ | xargs rm -rf \
    \
    && echo "===> Adding hosts for convenience..." \
    && mkdir -p /etc/ansible \
    && echo 'localhost' > /etc/ansible/hosts

# default command: display Ansible version
ENTRYPOINT [ "ansible-playbook" ]
CMD [ "--version" ]
