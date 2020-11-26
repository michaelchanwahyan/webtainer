FROM ubuntu:20.04
LABEL maintainer "michaelchan_wahyan@yahoo.com.hk"

ENV SHELL=/bin/bash \
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/node-v14.15.1-linux-x64/bin

RUN apt-get -y update ;\
    apt-get -y upgrade

RUN apt-get -y install screen htop wget vim curl git net-tools \
               apt-transport-https bc ca-certificates xz-utils

RUN cd / ;\
    wget https://nodejs.org/dist/v14.15.1/node-v14.15.1-linux-x64.tar.xz ;\
    tar -xf node-v14.15.1-linux-x64.tar.xz

EXPOSE 8080 8888
CMD [ "/bin/bash" ]
