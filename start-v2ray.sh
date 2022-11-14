#!/bin/bash
# author: gfw-breaker

# start containers
docker-compose up -d

# set firewall
#systemctl stop firewalld 
#systemctl disable firewalld 

which yum >/dev/null && { echo Fedora flavour; OS=redhat; }
which zypper >/dev/null && { echo Suse of sorts; OS=suse; }
which apt-get >/dev/null && { echo Debian based; OS=debian; }

if [[ $OS = 'suse' || $OS = 'redhat' ]]
then
  sudo firewall-cmd add-port 80/tcp --permannent
  sudo firewall-cmd add-port 443/tcp --permannent
  sudo firewall-cmd --reload
else 
  sudo ufw allow 80/tcp
  sudo ufw allow 443/tcp
fi

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

