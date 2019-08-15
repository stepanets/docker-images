FROM ubuntu:bionic

MAINTAINER Artem Dekhtyar <m@artemd.ru>

RUN apt update -y && apt install -y openssh-server; \
    mkdir /var/run/sshd; \
    rm -rf /var/lib/apt/lists/*

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

COPY id_rsa.pub /tmp/id_rsa.pub

RUN cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys

ENTRYPOINT ["/usr/sbin/sshd"]

CMD ["-D"]
