
FROM ubuntu:20.04

RUN echo "===> "  && \
    apt-get update  &&  apt-get install -y --no-install-recommends gnupg2   && \
    
    \
    \
    echo "===> Installing Python3 and Pip3 ..."  && \
    apt-get install -y --no-install-recommends python3-pip  && \
    \
    \
    echo "===> Installing handy tools (not absolutely required)..."  && \
    apt-get install -y --no-install-recommends sshpass openssh-client git curl     && \
    pip3 install --no-cache-dir ansible && \
    echo "===> Cleanup" && \
    apt-get clean 

CMD [ "ansible-playbook", "--version" ]
