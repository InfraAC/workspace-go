# workspace

## 流程
    拉取
        git clone https://github.com/InfraAC/workspace.git
    下载
        for k in go docker kubectl;do
          cd $PWD/$k
          sh main.sh
        done
    编译
        docker build -t workspace:1.0.1 .
    linux运行
        docker run -d --privileged --name workspace -p 22:22 -v /var/run/docker.sock:/var/run/docker.sock -v /Users/eric/work:/root/work workspace:1.0.1
    mac运行
        docker run -d --privileged --network=bridge -p 22:22 -p 8080-9090:8080:9090 --name workspace -v /var/run/docker.sock:/var/run/docker.sock -v /Users/eric/work:/root/work workspace:1.0.1
        注意
          Mac访问容器网络需桥接，当然还有其它方式
          8080-9090端口为备用端口
    windows运行
        # Expose daemon on tcp://宿主机ip:2375 without TLS
        # New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
        # -e DOCKER_HOST 192.168.1.3 
        docker run -d --privileged --name workspace -p 22:22 -v /d/app/go:/home/go workspace:1.0.1
    进入
        docker exec -it workspace bash
    销毁
        docker stop workspace && docker rm workspace