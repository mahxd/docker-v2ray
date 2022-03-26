#!/bin/bash
# author: gfw-breaker

if [ -f /etc/redhat-release ]; then
	yum remove -y docker docker-common docker-selinux docker-engine
	yum install -y yum-utils device-mapper-persistent-data lvm2
	yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	yum install -y docker-ce docker-ce-cli containerd.io docker-compose
else
	apt-get -y install ca-certificates curl gnupg lsb-release
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
		| gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) \
		signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
		https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
		| tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
fi

systemctl enable docker --now

