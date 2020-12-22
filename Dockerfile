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

# # https://etroimcasso.xyz/2019/04/08/node-npm-intro/#using-express-generator
# RUN npm install express-generator -g ;\
#     npm install nodemon -g

# https://medium.com/javascript-in-plain-english/create-a-single-page-website-using-node-js-and-express-js-a0b53e396e4f

RUN apt-get -y update ;\
    apt-get -y upgrade ;\
    apt-get -y install build-essential libssl-dev libffi-dev \
               python3 python3-pip python3-dev python3-venv

RUN cd / ;\
    git clone https://github.com/ImageMagick/ImageMagick ;\
    cd ImageMagick ;\
    git checkout tags/7.0.10-51 ;\
    /usr/bin/sh configure ;\
    make -j12 ;\
    make install

COPY [ ".bashrc" , ".vimrc"           , "/root/"      ]
COPY [ "startup.sh"                   , "/"           ]

EXPOSE 8080 8888
CMD [ "/bin/bash" ]
