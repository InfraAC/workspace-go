#!/bin/bash

curl -o docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-19.03.3.tgz

tar -xzvf docker.tgz
cp docker/docker ./docker-client
rm -rf docker.tgz docker/