#!/bin/bash
# this is a prv8 ovpn configer
# Author : https://github.com/B14ckP4nd4


clear

cat << EOF

                                                                                
                       .:llll:.                .;llllc'                         
                     .lKWMMMMWXklcloxxxxxxoc:cxKWMMMMMXd'                       
                    .kWMMMMMMMMMMMMMMMMMMMMMWMMMMMMMMMMWO.                      
                    .kMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0'                      
                     ;kNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0c.                      
           .'''',.     lNMMMMWNOolxNMMMMMMNklokXWMMMMNd.    .'''''.             
         'dXNNNNNx.   .xWMMW0l'   :KMMMMMMNl   .:OWMMWk.   .oXNNNNXk,           
        ;0WMMMMMK:    :XMMMNc   .lKMMMMMMMMXo.   ;KMMMNl    ;KMMMMMMK:          
      .cKMMMMMMWx.   'OWMMMN:  .dNMMMMMMMMMMWk'  ,KMMMM0,    oWMMMMMMXl.        
     .xNMMMMMMW0;   .dWMMMMW0:;kWMMMMMMMMMMMMW0::OWMMMMWx.   ,ONWMMMMMWk'       
    ;0WMMMMMKo,.    ,KMMMMMMMWNWMMW0occcclOWMMMWWMMMMMMMX:    .,l0MMMMMWK:      
   :KMMMMMMMx.      lNMMMMMMMMMMMMWO'    .xWMMMMMMMMMMMMWo       lWMMMMMMXc     
  lNMMMMMMMWo       .kWMMMMMMMMMMMMW0doddOWMMMMMMMMMMMMWO,       lNMMMMMMMXo.   
 .xMMMMMMMMNl        .xWMMMMMWWXKOOkxoooddkOO0XWWMMMMMWk'        :XMMMMMMMWk.   
 .xMMMMMMMMWx.        .o0Odoc:;'. .......... ..,;codk0x.        .oNMMMMMMMWk.   
 .xMMMMMMMMMWKl.        .   ..,:coxkO0000Okxol:,..   .        .c0WMMMMMMMMWk.   
 .xMMMMMMMMMMMWO;     .';cox0KNWMMMMMMMMMMMMMMMNX0kol:'.     'kNMMMMMMMMMMWk.   
 .xMMMMMMMMMMMMWd   :k0NWMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKkl.  lWMMMMMMMMMMMWk.   
 .xMMMMMMMMMMMMWd. .OMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMX:  lWMMMMMMMMMMMWk.   
 .dMMMMMMMMMMMMWd  .OMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMX:  lWMMMMMMMMMMMWk.   
  'dXMMMMMMMMMMWd  .OMMMNXWMMMMMMMMMMMMMMMMMMMMMMMMWXXWMMX:  lWMMMMMMMMMMNx'    
    cXMMMMMMMMMWd  .OMMMO;,lkKWMMMMMMMMMMMMMMMMWXko;,xWMMX:  lWMMMMMMMMMNo.     
     ,xNMMMMMMMWd  .OMMMNo. .cXMMMMMMMMMMMMMMMMNo. .lXMMMN:  lWMMMMMMMNk;       
       cKMMMMMMWd  .OMMMMNd::;l0WMMMMMWMMMMMMWKo;:coXMMMMX:  lWMMMMMMXl.        
        ,OWMMMMWd. .OMMMMMWWW0l:o0WMWOlkNWMWKd:lONWWMMMMMX:  lWMMMMW0;          
         .lXMMMWd  .OMMMMMMMMMMXdxXWO' .:kNNkd0WMMMMMMMMMX:  lWMMMXo.           
           ,OWMWd  .OMMMMMMMMMMW0l:,.    .,;lOWMMMMMMMMMMX:  lWMW0:             
            .dNWd. .OMMMMMMMMMMMNk;        ;xXMMMMMMMMMMMX:  lWNx.              
              ;Oo. .OMMMMMMMMMMMMM0'      .OMMMMMMMMMMMMMX:  lOc.               
               ..  .OMMMMMMMMMMMMWk''ldoc,.oWMMMMMMMMMMMMX:  ..                 
                   .OMMMMMMMWNXKKNK0NMMMMN0KNXKXNWMMMMMMMX:                     
                   .OMMMMMMNd,..oWMMMMMMMMMMWx'.,oXMMMMMMX:                     
                   .OMMMWKd,   .kMMMMMMMMMMMM0,   'o0WMMMX;                     
                   .dWMMXd:. .l0WMMMMMMMMMMMMWXd' .;oKMMMk.                     
                    ;KMMWWNdl0WMMMMMMMMMMMMMMMMWXooXMWMMX:                      
                .c;  ;0WMMWWWMMMMMMMMMMMMMMMMMMMMWNWMMMKc  'l'                  
              'l0WXl. .dXWMMMMMMMMMMMMMMMMMMMMMMMMMMMXx'  :KWKd,                
            ,xXMMMMWx'  ,kNWMMMMMMMMMMMMMMMMMMMMMMMNk;  .dNMMMMNk;              
         .,dXMMMMMMMWKo, .,oONMMMMMMMMMMMMMMMMMMN0d,. 'l0WMMMMMMMNx;.           
        :ONMMMMMMMMMMMMNx,  .;oONMMMMMMMMMMMMN0d;.  'dXWMMMMMMMMMMMW0c.         
       cXMMMMMMMMMMMMMMMMNkl,. .,lxOXNWWNX0xo,. .'lkXWMMMMMMMMMMMMMMMNo.        
      .OMMMMMMMMMMMMMMMMMMMMN0x:.   .,c;'.   .:dOXWMMMMMMMMMMMMMMMMMMM0'        
      cXMMMMMMMMMMMMMMMMMMMMMMMWKxc,.     'cd0NMMMMMMMMMMMMMMMMMMMMMMMNl        
     .xWMMMMMMMMMMMMMMMMMNXKkdol;'..      ..';codkKXNWMMMMMMMMMMMMMMMMMO.       
     ;KMMMMMMMMMMMMMMWN0o,..                      ..,lOXWMMMMMMMMMMMMMMX:       
     oWMMMMMMMMMMMMW0l'.                               'lONMMMMMMMMMMMMMx.      
   .cKMMMMMMMMMMW0o;.                                    .;oONMMMMMMMMMMXl.     
  ;ONMMMMMMMMMMM0'                                          .kMMMMMMMMMMMW0c.   
 .xMMMMMMMMMMMMWd.                                           lWMMMMMMMMMMMWk.   
 .xMMMMMMMMMMMMX:                                            ,KMMMMMMMMMMMWk.   
  cOkkkkkkkkkkOo.                                            .lkkkkkkkkkkOkl.   
                                                                                   
                                                                                                
                                BlackPanda    
                        https://github.com/B14ckP4nd4                                                                     
EOF

TCP_CONFIG_PATH="/home/ovpn/tcp"
UDP_CONFIG_PATH="/home/ovpn/udp"
TCP_PORT=443
UDP_PORT=1194
NETWORK_NAME='openvpn'

# set envs
if [[ "$1" ]]; then
    TELEGRAM_BOT_TOKEN=$1
fi

if [[ "$2" ]]; then
    TELEGRAM_CHAT_ID=$2
fi

if [[ "$3" ]]; then
    TCP_CONFIG_PATH=$3
fi

if [[ "$4" ]]; then
    UDP_CONFIG_PATH=$4
fi

if [[ "$5" ]]; then
    TCP_PORT=$5
fi


if [[ "$6" ]]; then
    UDP_PORT=$6
fi

# sources
OPENVPN_BUILDER_URL="https://raw.githubusercontent.com/B14ckP4nd4/docker-alphine-openvpn/main/build.sh"
OPENVPN_BUILDER="/root/openvpn-builder.sh"


#add force yes to yum
echo 'assumeyes=1' >> /etc/yum.conf

echo "========= [ Start Updating Sever Packages ] ========="

# update server
yum update

# install epel release
yum install epel-release -y

# install Development Tools
yum group install "Development Tools" 

# install docker
yum install yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io
yum update

# start and startup docker
systemctl start docker
systemctl enable docker

# create telegram sender
git clone https://github.com/fabianonline/telegram.sh /etc/telegram.sh

# create config env file for buiding
rm -rf /root/ovpn_envs.conf
touch /root/ovpn_envs.conf
echo "TCP_PORT=\"${TCP_PORT}\"" >> /root/ovpn_envs.conf
echo "TCP_PATH=\"${TCP_PATH}\"" >> /root/ovpn_envs.conf
echo "UDP_PORT=\"${UDP_PORT}\"" >> /root/ovpn_envs.conf
echo "UDP_PATH=\"${UDP_PATH}\"" >> /root/ovpn_envs.conf

# add telegram to path
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/etc/telegram.sh
export PATH
# create Telegram Configuration
rm -rf /etc/telegram.sh.conf
touch /etc/telegram.sh.conf
echo "TELEGRAM_TOKEN=\"${TELEGRAM_BOT_TOKEN}\"" >> /etc/telegram.sh.conf
echo "TELEGRAM_CHAT=\"${TELEGRAM_CHAT_ID}\"" >> /etc/telegram.sh.conf
echo "IP=$(wget -qO- http://ipecho.net/plain | xargs echo)" >> /etc/telegram.sh.conf
# apend
cat /root/ovpn_envs.conf >> /etc/telegram.sh.conf

# add ENVs
source /etc/telegram.sh.conf

# start Configuration server

#get builder
# wget $OPENVPN_BUILDER_URL -O $OPENVPN_BUILDER
# chmod +x $OPENVPN_BUILDER

# create Network
yes | docker system prune

# network configuration
docker network inspect $NETWORK_NAME >/dev/null 2>&1 || \
    docker network create $NETWORK_NAME


docker rm -f $(docker ps | grep ovpn-tcp | awk '{print $1}')
docker rm -f $(docker ps | grep ovpn-udp | awk '{print $1}')

# Build TCP
mkdir -p $UDP_CONFIG_PATH
# Create Container
docker create \
  --cap-add=NET_ADMIN \
  --name=ovpn_udp \
  --network=$NETWORK_NAME \
  --privileged \
  -e PROTO=udp \
  -e PORT=1194 \
  -e INTERFACE='eth0' \
  -p $UDP_PORT:1194/udp \
  -v $UDP_CONFIG_PATH:/config \
  --restart always \
  b14ckp4nd4/alphine-openvpn:0.1

mkdir -p $TCP_CONFIG_PATH

# Create Container
docker create \
  --cap-add=NET_ADMIN \
  --name=ovpn_tcp \
  --network=$NETWORK_NAME \
  --privileged \
  -e PROTO=tcp \
  -e PORT=443 \
  -e INTERFACE='eth0' \
  -p $TCP_PORT:443/tcp \
  -v $TCP_CONFIG_PATH:/config \
  --restart always \
  b14ckp4nd4/alphine-openvpn:0.1


# run containers
docker start ovpn_udp
docker start ovpn_tcp


# create connections senders script
wget https://raw.githubusercontent.com/B14ckP4nd4/ovpnConfiger/alpine/telegram-sender.sh -O /root/telegram-sender.sh
chmod +x /root/telegram-sender.sh


# add to crontab
{ crontab -l; echo "* * * * * /bin/bash /root/telegram-sender.sh tcp ${TCP_CONFIG_PATH}"; } | crontab - \
&& { crontab -l; echo "* * * * * /bin/bash /root/telegram-sender.sh udp ${UDP_CONFIG_PATH}"; } | crontab -

# reset crontab
systemctl restart crond


# send starting Message
#telegram -H "<b>[ Start Configuration OVPN Server ]</b> "$'\n\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"