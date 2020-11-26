#!/bin/sh
docker build -t webtainer:latest ./
docker rmi   -f $(docker images -f "dangling=true" -q)
