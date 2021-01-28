

# pull base image
FROM yremmetsva/ansible:ubuntu20.04

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"
RUN echo "===> Installing Docker"  && \
    apt-get update  && apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common  # && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get install docker-ce && \ #TODO Figure out how to install Docker during build

RUN echo "===> Python Docker "  && \
    pip3 install --upgrade docker docker-compose
