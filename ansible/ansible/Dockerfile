FROM ubuntu

RUN apt update && \
    apt install software-properties-common -y && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt install ansible -y

COPY ssh /root/.ssh

EXPOSE 22

CMD tail -f /dev/null
