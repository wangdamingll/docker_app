# docker_app
this is test docker app

# dcoker pull
Configure the Docker client proxy
https://docs.docker.com/engine/cli/proxy/

# docker config
cat /etc/docker/daemon.json    
{
    "registry-mirrors": [
        "https://dockerproxy.com",
        "https://docker.m.daocloud.io",
        "https://cr.console.aliyun.com",
        "https://ccr.ccs.tencentyun.com",
        "https://hub-mirror.c.163.com",
        "https://mirror.baidubce.com",
        "https://docker.nju.edu.cn",
        "https://docker.mirrors.sjtug.sjtu.edu.cn",
        "https://github.com/ustclug/mirrorrequest",
        "https://registry.docker-cn.com"
    ],
    "proxies": {
        "http-proxy": "socks5://127.0.0.1:1080",
        "https-proxy": "socks5://127.0.0.1:1080"
    }
}

# use  
./app.sh run  
./testapp
