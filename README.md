# workspace

## 流程
    拉取
        git clone https://github.com/InfraAC/workspace.git
    编译
        docker build -t workspace:1.0.1 .
    linux运行
        docker run -d --privileged --name workspace -p 22:22 -v /var/run/docker.sock:/var/run/docker.sock -v /Users/huangzhifeng/workspace:/root/workspace workspace:1.0.1
    windows运行
        # Expose daemon on tcp://宿主机ip:2375 without TLS
        # New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
        # -e DOCKER_HOST 192.168.1.3 
        docker run -d --privileged --name workspace -p 22:22 -v /d/app/go:/home/go workspace:1.0.1
    进入
        docker exec -it workspace bash
    销毁
        docker stop workspace && docker rm workspace