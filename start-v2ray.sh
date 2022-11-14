#!/bin/bash
# author: gfw-breaker

# start containers
docker-compose up -d

# set firewall
systemctl stop firewalld 
systemctl disable firewalld 

# show attributes
nic=$(ip link | egrep ' ens| eth| enp' | cut -d':' -f2)

#ip=$(ip addr show $nic | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)
ip=$(curl -4 -q icanhazip.com)

#uuid=$(cat data/v2ray/config.json | grep '"id"' | cut -d'"' -f4)
uuid=$(cat data/v2ray/config.json | grep '"id"\|"alterId"')

path=$(cat data/nginx/conf.d/v2ray.conf | grep location | grep -v '/ ' | awk '{print $2}')

echo
echo "v2ray VMESS："
echo -e "addr:\t$ip"
echo -e "$uuid"
echo -e "path:\t$path"
echo

