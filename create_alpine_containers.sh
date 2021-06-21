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

# send starting Message
telegram -H "<b>[ Start Configuration OVPN Server ]</b> "$'\n\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"


# start Configuration server

#get builder
wget $OPENVPN_BUILDER_URL -O $OPENVPN_BUILDER
chmod +x $OPENVPN_BUILDER

# Build TCP
. $OPENVPN_BUILDER "$TCP_PORT" tcp "$TCP_CONFIG_PATH"
. $OPENVPN_BUILDER "$UDP_PORT" udp "$UDP_CONFIG_PATH"

# run containers
docker start ovpn-udp
docker start ovpn-tcp


# create connections senders script
rm -rf /root/{udp,tcp}-config-sender.sh
touch /root/{udp,tcp}-config-sender.sh
chmod +x /root/{udp,tcp}-config-sender.sh


cat <<EOT >> /root/udp-config-sender.sh
#!/bin/bash

# wait for network
until ping -c1 www.google.com >/dev/null 2>&1; do sleep 5; done

set -ex

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/etc/telegram.sh
source /etc/telegram.sh.conf

if [[ -f "/root/udp-sent" ]]; then

    # remove scripts
    rm -rf /root/udp-sent
    rm -rf $0

    # disable cronjob
    crontab -u root -l | grep -v '* * * * * /bin/bash /root/udp-config-sender.sh'  | crontab -u root -

    exit 1
fi

count=$(ls -1 $UDP_PATH/*.ovpn 2>/dev/null | wc -l)

if [[ $count != 0 ]]; then
    
    CONF_NAME=$( ls  ${UDP_PATH}/client/ | grep .ovpn | awk 'END{print $1}' )

    cp ${CONF_NAME} /root/${HOSTNAME}-${IP}-udp.ovpn

    echo \"1\" > /root/udp-sent

    # send them to telegram
    exec /bin/bash telegram -f /root/${HOSTNAME}-${IP}-udp.ovpn -H "<b>[ ✅ Connection is Ready! ]</b> "$'\n\n'"🔵 UDP Protocol "$'\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"
fi

EOT

cat <<EOT >> /root/tcp-config-sender.sh
#!/bin/bash

# wait for network
until ping -c1 www.google.com >/dev/null 2>&1; do sleep 5; done

set -ex

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/etc/telegram.sh
source /etc/telegram.sh.conf

if [[ -f "/root/tcp-sent" ]]; then

    # remove scripts
    rm -rf /root/tcp-sent
    rm -rf $0

    # disable cronjob
    crontab -u root -l | grep -v '* * * * * /bin/bash /root/tcp-config-sender.sh'  | crontab -u root -

    exit 1
fi

count=$(ls -1 $UDP_PATH/*.ovpn 2>/dev/null | wc -l)

if [[ $count != 0 ]]; then
    
    CONF_NAME=$( ls  ${TCP_PATH}/client/ | grep .ovpn | awk 'END{print $1}' )

    cp ${CONF_NAME} /root/${HOSTNAME}-${IP}-tcp.ovpn

    echo \"1\" > /root/tcp-sent

    # send them to telegram
    exec /bin/bash telegram -f /root/${HOSTNAME}-${IP}-tcp.ovpn -H "<b>[ ✅ Connection is Ready! ]</b> "$'\n\n'"🔴 TCP Protocol "$'\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"
fi
EOT

# add to crontab
{ crontab -l; echo "* * * * * /bin/bash /root/udp-config-sender.sh"; } | crontab - \
&& { crontab -l; echo "* * * * * /bin/bash /root/tcp-config-sender.sh"; } | crontab -

# reset crontab
systemctl restart crond