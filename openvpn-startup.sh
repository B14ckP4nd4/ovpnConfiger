#!/bin/bash

# wait for network

until ping -c1 www.google.com >/dev/null 2>&1; do sleep 20; done;

# enable debuging
set -ex

source /etc/environment
source /etc/profile
# restore SHELL env var for cron
SHELL=/bin/bash

# install git
yes | yum install git -y

# clone telegram sender
rm -rf /etc/telegram.sh
git clone https://github.com/fabianonline/telegram.sh /etc/telegram.sh

# add telegram to path
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/etc/telegram.sh
export PATH

# set Enviroments for telegram sender
# regenerate config file
rm -rf /etc/telegram.sh.conf
touch /etc/telegram.sh.conf
echo "TELEGRAM_TOKEN=\"${1}\"" >> /etc/telegram.sh.conf
echo "TELEGRAM_CHAT=\"${2}\"" >> /etc/telegram.sh.conf
echo "UDP_PATH=\"/home/ovpn-udp/client\"" >> /etc/telegram.sh.conf
echo "TCP_PATH=\"/home/ovpn-tcp/client\"" >> /etc/telegram.sh.conf
echo "IP=$(wget -qO- http://ipecho.net/plain | xargs echo)" >> /etc/telegram.sh.conf

PASSWORD=${3}

# download installer
wget https://raw.githubusercontent.com/B14ckP4nd4/ovpnConfiger/master/passless-configure.sh -O ovpn.sh
chmod +x ovpn.sh

# add ENVs
source /etc/telegram.sh.conf

# send starting Message
telegram -H "<b>[ Start Configuration OVPN Server ]</b> "$'\n\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"

# update CENTOS
yes | yum update -y

# send starting Message
telegram -H "<b>[ ✅ Server Packages updated successfully ]</b> "$'\n\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"

# create connections senders script
rm -rf /root/{udp,tcp}-config-sender.sh
touch /root/{udp,tcp}-config-sender.sh
chmod +x /root/{udp,tcp}-config-sender.sh


# cat <<EOT >> /root/telegram-config-sender.sh
# #!/usr/bin/env bash
# { crontab -l; echo "* * * * * /bin/bash /root/tcp-config-sender.sh"; } | crontab -
# { crontab -l; echo "* * * * * /bin/bash /root/udp-config-sender.sh"; } | crontab -

# crontab -u root -l | grep -v '* * * * * /bin/bash /root/telegram-config-sender.sh'  | crontab -u root -

#     # self destroy
#    rm -rf $0
# EOT


# set CronJob
cat <<EOT >> /root/udp-config-sender.sh
#!/bin/bash

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

if [[ -f "${UDP_PATH}/client-udp-1194.ovpn" ]]; then
    # wait for network
    until ping -c1 www.google.com >/dev/null 2>&1; do sleep 5; done

    cp ${UDP_PATH}/client-udp-1194.ovpn /root/${HOSTNAME}-${IP}-udp.ovpn

    touch /root/udp-sent

    # send them to telegram
    exec /bin/bash telegram -f /root/${HOSTNAME}-${IP}-udp.ovpn -H "<b>[ ✅ Connection is Ready! ]</b> "$'\n\n'"🔵 UDP Protocol "$'\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"
fi

EOT

cat <<EOT >> /root/tcp-config-sender.sh
#!/bin/bash

set -ex

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/etc/telegram.sh
source /etc/telegram.sh.conf


if [[ -f "/root/tcp-sent" ]]; then

    #remove scripts
    rm -rf /root/tcp-sent
    rm -rf $0

    # disable cronjob
    crontab -u root -l | grep -v '* * * * * /bin/bash /root/tcp-config-sender.sh'  | crontab -u root -

    exit 1
fi

if [[ -f "${TCP_PATH}/client-tcp-443.ovpn" ]]; then
    # wait for network
    until ping -c1 www.google.com >/dev/null 2>&1; do sleep 5; done
    cp ${TCP_PATH}/client-tcp-443.ovpn /root/${HOSTNAME}-${IP}-tcp.ovpn
    touch /root/tcp-sent

    # send them to telegram
    exec /bin/bash telegram -f /root/${HOSTNAME}-${IP}-tcp.ovpn -H "<b>[ ✅ Connection is Ready! ]</b> "$'\n\n'"🔴 TCP Protocol "$'\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"


fi

EOT

# remove it
rm -rf $0

# execute needed scripts by cronjob


    # set config sender cron
    # { crontab -l; echo "@reboot /bin/bash /root/telegram-config-sender.sh"; } | crontab -


    # set ovpn configurator cron
    { crontab -l; echo "@reboot /bin/bash /root/ovpn.sh ${PASSWORD}"; } | crontab -
    sleep 5;
    { crontab -l; echo "* * * * * /bin/bash /root/tcp-config-sender.sh"; } | crontab -
    sleep 5;
    { crontab -l; echo "* * * * * /bin/bash /root/udp-config-sender.sh"; } | crontab -

    echo $'\n' >> /root/ovpn.sh
    echo "{ crontab -l; echo \"* * * * * /bin/bash /root/udp-config-sender.sh\"; } | crontab -"
    echo "{ crontab -l; echo \"* * * * * /bin/bash /root/tcp-config-sender.sh\"; } | crontab -"
    
    { crontab -l; echo "* * * * * /bin/bash /root/udp-config-sender.sh"; } | crontab -
    echo "crontab -u root -l | grep -v '@reboot /bin/bash /root/ovpn.sh ${PASSWORD}'  | crontab -u root -" >> /root/ovpn.sh

    # reboot the server for run the script
    reboot now