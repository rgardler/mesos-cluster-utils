FROM ubuntu:14.04
MAINTAINER Anthony Howe

RUN apt-get update && apt-get install -y wget python ssh curl nmap jq
RUN wget https://parallel-ssh.googlecode.com/files/pssh-2.3.1.tar.gz -O /tmp/pssh.tar.gz 
RUN tar xvf /tmp/pssh.tar.gz --directory /tmp
RUN cd /tmp/pssh-2.3.1 && python setup.py install && cd -
RUN rm -rf /tmp/*

VOLUME [ "/root/.ssh" ]

COPY root /root/.
COPY bin /usr/local/bin/.

WORKDIR /root/.

ENTRYPOINT ["/bin/bash"]
