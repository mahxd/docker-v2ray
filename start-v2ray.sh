#!/bin/bash
# author: gfw-breaker

# start containers
docker-compose up -d

# set firewall
systemctl stop firewalld 
systemctl disable firewalld 

# show attributes
nic=$(/usr/sbin/ifconfig | egrep '^ens|^eth' | cut -d':' -f1)
ip=$(/usr/sbin/ifconfig $nic | grep 'inet ' | awk '{print $2}')
uuid=$(cat data/v2ray/config.json | grep '"id"' | cut -d'"' -f4)
path=$(cat data/nginx/conf.d/v2ray.conf | grep location | grep -v '/ ' | awk '{print $2}')

echo
echo "v2ray客户端参数："
echo -e "addr:\t$ip"
echo -e "id:\t$uuid"
echo -e "path:\t$path"
echo

