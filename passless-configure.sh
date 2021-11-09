#!/bin/bash
# this is a prv8 ovpn configer
# Author : https://github.com/B14ckP4nd4


clear

echo "    ____  __           __      ____                  __           ";
echo "   / __ )/ /___ ______/ /__   / __ \____ _____  ____/ /___ _      ";
echo "  / __  / / __ \`/ ___/ //_/  / /_/ / __ \`/ __ \/ __  / __ \`/      ";
echo " / /_/ / / /_/ / /__/ ,<    / ____/ /_/ / / / / /_/ / /_/ /       ";
echo "/_____/_/\__,_/\___/_/|_|  /_/    \__,_/_/ /_/\__,_/\__,_/        ";
echo "   ____ _    ______  _   __   _            __        ____         ";
echo "  / __ \ |  / / __ \/ | / /  (_)___  _____/ /_____ _/ / /__  _____";
echo " / / / / | / / /_/ /  |/ /  / / __ \/ ___/ __/ __ \`/ / / _ \/ ___/";
echo "/ /_/ /| |/ / ____/ /|  /  / / / / (__  ) /_/ /_/ / / /  __/ /    ";
echo "\____/ |___/_/   /_/ |_/  /_/_/ /_/____/\__/\__,_/_/_/\___/_/     ";
echo "                                                                  ";

echo -e "\e[1;31m Hello Darlin :) \e[0m \n"
echo -e "\e[1;32m This is a PRV8 OVPN Configer and if you aren't one of us, plase hit the 'CTRL + C' now and don't waste your time. \e[0m \n"
echo -e "\e[1;46m Author : https://github.com/B14ckP4nd4 \e[0m \n"

echo -e " \n\n\n"
echo "------------------"

set -x

if [[ $1 ]]; then
  
  echo "start configure \n"

  yes | yum update -y
  
  cd /etc/
  #remove old repos
  yes | rm -rf gck
  yes | rm -rf docker-openvpn
  yes | rm -rf git-crypt
  
  #install dependencies
  yes | yum install git zip unzip dos2unix openssl-devel -y
  
  # get repos
  yes | git clone https://github.com/B14ckP4nd4/gck
  yes | git clone https://github.com/B14ckP4nd4/docker-openvpn -b dev
  yes | git clone https://github.com/AGWA/git-crypt
  
  #extract gck
  yes | unzip -P $1 /etc/gck/gck.zip -d /etc/gck/
  
  #add force yes to yum
  echo 'assumeyes=1' >> /etc/yum.conunf
  
  #updating os
   yes | sudo yum --disablerepo=\* --enablerepo=base,updates update &&
   yes | sudo yum update -y
   yes | sudo yum install epel-release -y
   yes | sudo yum group install "Development Tools" -y
   yes | sudo yum -y update
   
   # reinstall docker
   yes | sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

  yes | rm -f /etc/yum.repos.d/docker-ce.repo
#SET UP THE REPOSITORY

  #install dependencies for docker
  yes | sudo yum install yum-utils \
  device-mapper-persistent-data \
  lvm2

   yes | sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

  yes | sudo yum install docker-ce docker-ce-cli containerd.io -y
  sudo systemctl start docker && sudo systemctl enable docker

  # set network
  docker network create --subnet=200.0.0.0/24 opvn_network

  # install git-crypt
  cd /etc/git-crypt && make && make install

  # unlock the repo
  cd /etc/docker-openvpn && /usr/local/bin/git-crypt unlock /etc/gck/thekey

  # edit endline
  find /etc/docker-openvpn -type f -print0 | xargs -0 dos2unix --
  
  # remove this script
  yes | rm -rf $0

  # config UDP and TCP
  chmod +x /etc/docker-openvpn/rebuild-udp
  yes | /etc/docker-openvpn/rebuild-udp

  chmod +x /etc/docker-openvpn/rebuild-tcp
  yes | /etc/docker-openvpn/rebuild-tcp

  # block Bogons
  wget https://raw.githubusercontent.com/B14ckP4nd4/ovpnConfiger/master/block-bogons.sh -O /etc/block-bogons.sh
  chmod +x /etc/block-bogons.sh
  yes | /etc/block-bogons.sh

  # block at startup

  cat <<EOT >> /root/ipset-restore.sh
    #!/bin/bash

    set -ex

    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin

    grep ^create /etc/ipset.conf | ipset restore 2>/dev/null || true
    grep ^add /etc/ipset.conf | ipset restore 2>/dev/null

    sudo iptables -A INPUT -m set --match-set bogons src -j DROP
    sudo iptables -A INPUT -m set --match-set bogons dst -j DROP
    sudo iptables -A FORWARD -m set --match-set bogons src -j DROP
    sudo iptables -A FORWARD -m set --match-set bogons dst -j DROP
    iptables -S

EOT

chmod +x /root/ipset-restore.sh
{ crontab -l; echo "@reboot "$(command -v bash)" /root/ipset-restore.sh"; } | crontab -



  #reboot now
  
else
  exit 0
fi

{ crontab -l; echo "* * * * * /bin/bash /root/udp-config-sender.sh"; } | crontab - \
&& { crontab -l; echo "* * * * * /bin/bash /root/tcp-config-sender.sh"; } | crontab -


