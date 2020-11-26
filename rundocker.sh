#!/bin/sh
clear
export TZ=Asia/Hong_Kong
docker rm -f sleepy_jirachi
docker run -p 8888:8888 \
           -p 8080:8080 \
           -v /webapp:/webapp \
           -dt \
           --name=sleepy_jirachi \
           --memory=4g \
           webtainer:latest \
           /bin/bash startup.sh
