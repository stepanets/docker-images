FROM ubuntu:bionic

MAINTAINER Artem Dekhtyar <m@artemd.ru>

RUN apt update -y && apt install -y openssh-client python software-properties-common; \
    apt-add-repository --yes --update ppa:ansible/ansible; \
    apt install -y ansible; \
    mkdir -p /root/.ssh; \
    ssh-keygen -t rsa; \
    mkdir -p /ansible; \
    rm -rf /var/lib/apt/lists/*

COPY id_rsa.pub /root/.ssh/id_rsa.pub
COPY id_rsa /root/.ssh/id_rsa

RUN chmod 600 /root/.ssh/*

WORKDIR /ansible
