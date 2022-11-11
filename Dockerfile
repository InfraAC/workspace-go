FROM ubuntu:20.04

ENV TZ='Asia/Shanghai'

# sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && apt-get update && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt-get install -y tzdata && \
    apt-get install -y iptables && \
    apt-get install -y openssh-server && \
    apt-get install -y git && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo 'root:123456'|chpasswd && \
    mkdir /var/run/sshd && \
	sed -ri --expression 's/^#(PasswordAuthentication\s+).*/\1yes/' /etc/ssh/sshd_config && \
    sed -ri --expression 's/^#(PermitRootLogin\s+).*/\1yes/' /etc/ssh/sshd_config &&\
    sed -ri --expression 's/^#(GatewayPorts\s+).*/\1yes/' /etc/ssh/sshd_config

COPY ./go1.17.5.linux-amd64/go.tar.gz /tmp
RUN tar -C /usr/local -xzf /tmp/go.tar.gz && \
    rm -f /tmp/* && \
    echo 'export PATH=/usr/local/go/bin:$PATH' >> /root/.bashrc

# install docker: only client
COPY ./docker-19.03.3.linux-x86_64/docker-client /usr/bin/docker
RUN chmod +x /usr/bin/docker && groupadd docker

# install kubectl
# curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.19.2/bin/linux/amd64/kubectl && \
#     chmod +x /usr/local/bin/kubectl
COPY ./kubectl-v1.19.2.linux-amd64/kubectl /usr/local/bin/
RUN chmod +x /usr/local/bin/kubectl

# #install docker-compose
# RUN curl -L -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.23.1/docker-compose-`uname -s`-`uname -m` && \
#     chmod +x /usr/local/bin/docker-compose

COPY ./entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]