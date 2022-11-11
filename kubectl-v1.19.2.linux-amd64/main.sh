#!/bin/bash

curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.19.2/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl