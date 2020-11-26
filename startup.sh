#!/bin/bash
pushd /webapp/node-ex-website
#npm install
screen -S web_session -dm npm start
bash
