#!/bin/bash
# author: gfw-breaker

# start containers
docker-compose up -d

# set firewall
systemctl stop firewalld 
systemctl disable firewalld 

# show attributes
nic=$(ip link | egrep ' ens| eth' | cut -d':' -f2)
ip=$(ip addr show $nic | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)
uuid=$(cat data/v2ray/config.json | grep '"id"' | cut -d'"' -f4)
path=$(cat data/nginx/conf.d/v2ray.conf | grep location | grep -v '/ ' | awk '{print $2}')

echo
echo "v2ray客户端参数："
echo -e "addr:\t$ip"
echo -e "id:\t$uuid"
echo -e "path:\t$path"
echo

