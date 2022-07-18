# pull base image
ARG BASE_IMAGE=ubuntu:22.04
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "===> Installing system tools..." \
    && apt-get update \
    && apt-get install --yes --no-install-recommends \
        build-essential \
        curl \
        git \
        gnupg2 \
        openssh-client \
        python3 \
        python3-dev \
        python3-pip \
        sshpass \
    \
    && echo "===> Installing Ansible..." \
    && apt-get install --yes --no-install-recommends ansible \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --upgrade pycrypto pywinrm \
    \
    && echo "===> Removing Ansible PPA..." \
    && rm -rf \
        /var/lib/apt/lists/* \
        /etc/apt/sources.list.d/ansible.list \
    && apt-get clean \
    \
    && echo "===> Adding hosts for convenience..." \
    && mkdir -p /etc/ansible \
    && echo 'localhost' > /etc/ansible/hosts

# default command: display Ansible version
ENTRYPOINT [ "ansible-playbook" ]
CMD [ "--version" ]
