# syntax=docker/dockerfile:1
# Dockerfile for building Ansible image for Alpine 3.
# @see https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md

# Pull base image
ARG BASE_IMAGE=alpine:3
FROM ${BASE_IMAGE} as install

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
RUN echo "===> Installing system packages..." \
    && apk update \
    && apk add --no-cache \
        sudo \
        ca-certificates \
        curl \
        git  \
        openssh-client \
        openssl \
        py3-pip \
        python3 \
        rsync \
        sshpass \
        wget \
    && apk add --no-cache --virtual build-dependencies \
        autoconf \
        automake \
        build-base \
        build-base \
        cmake \
        libffi-dev \
        libtool \
        openssl-dev \
	    perl-dev \
        python3-dev \
    && pip3 install --no-cache-dir --upgrade \
        cffi \
        pip \
        wheel \
    \
    && echo "===> Installing libyaml..." \
    && mkdir -p /tmp/libyaml \
    && cd /tmp/libyaml \
    && wget https://github.com/yaml/libyaml/releases/download/0.2.5/yaml-0.2.5.tar.gz \
    && tar -xf yaml-0.2.5.tar.gz \
    && cd yaml-0.2.5 \
    && ./configure \
    && make \
    && make install \
    && cd ../../ && rm -rf /tmp/libyaml \
    \
    && echo "===> Installing Ansible..." \
    && pip3 install --no-cache-dir ansible \
    && pip3 install --no-cache-dir --upgrade \
        pycrypto \
        pywinrm \
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

# default command: display Ansible playbook version.
WORKDIR /ansible
ENTRYPOINT [ "ansible-playbook" ]
CMD [ "--version" ]
