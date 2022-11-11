#!/bin/bash

# docker auth
# mkdir /root/.docker
# cat << EOF > /root/.docker/config.json
# {
#     "auths": {
#         "registry.cn-hongkong.aliyuncs.com": {
#             "auth": ""
#         }
#     }
# }
# EOF

# kube config
# mkdir /root/.kube
# cat << EOF > /root/.kube/config
# apiVersion: v1
# clusters:
# - cluster:
#     server: https://rancher.d.xxx.com/k8s/clusters/c-nfg8v
#   name: d
# contexts:
# - context:
#     cluster: d
#     user: d
#   name: d
# current-context: ""
# kind: Config
# preferences: {}
# users:
# - name: d
#   user:
#     token: xxx:xxx
# EOF

/usr/sbin/sshd -D &
docker -H 192.168.1.3 ps &
while true;do echo 'hello';sleep 3s;done