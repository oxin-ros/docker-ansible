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
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir \
        ansible \
        pycrypto \
        pywinrm \
    \
    && echo "===> Removing Unecessary packages..." \
    && apt-get purge --yes build-essential \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    \
    && echo "===> Adding hosts for convenience..." \
    && mkdir -p /etc/ansible \
    && echo 'localhost' > /etc/ansible/hosts

# default command: display Ansible version
ENTRYPOINT [ "ansible-playbook" ]
CMD [ "--version" ]
