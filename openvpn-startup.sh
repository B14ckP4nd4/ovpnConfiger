#!/bin/bash

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

# add ENVs
source /etc/telegram.sh.conf

# send starting Message
telegram -H "<b>[ Start Configuration OVPN Server ]</b> "$'\n\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"

# update CENTOS
yes | yum update -y

# send starting Message
telegram -H "<b>[ ✅ Server Packages updated successfully ]</b> "$'\n\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"

# create file sender script
rm -rf /root/telegram-config-sender.sh
touch /root/telegram-config-sender.sh
chmod +x /root/telegram-config-sender.sh

# set CronJob
cat <<EOT >> /root/telegram-config-sender.sh
#!/bin/bash

set -ex

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/etc/telegram.sh
source /etc/telegram.sh.conf

if [[ -f "${UDP_PATH}/client-udp-1194.ovpn" ]] && [[ -f "${TCP_PATH}/client-tcp-443.ovpn" ]]
then
    # wait for network
    until ping -c1 www.google.com >/dev/null 2>&1; do sleep 5; done

    # send them to telegram
    exec /bin/bash telegram -f ${UDP_PATH}/client-udp-1194.ovpn -H "<b>[ ✅ Connection is Ready! ]</b> "$'\n\n'"🔵 UDP Protocol "$'\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"
    exec /bin/bash telegram -f ${TCP_PATH}/client-tcp-443.ovpn -H "<b>[ ✅ Connection is Ready! ]</b> "$'\n\n'"🔴 TCP Protocol "$'\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"

    # disable cronjob
    crontab -u root -l | grep -v '* * * * * /bin/bash /root/telegram-config-sender.sh'  | crontab -u root -

    # remove this script
    rm -rf $0

fi

EOT

# remove it
rm -rf $0

# download configurator
#/usr/bin/wget https://git.io/JtLfM -O /root/ovpn.sh

# set permitions
#chmod +x /root/ovpn.sh

# set cronJob for running ovpn.sh ( without using " /bin/bash & /bin/sh in thirt level " )
# { crontab -l; echo "@reboot . /root/ovpn.sh ${PASSWORD}"; } | crontab -
# run it with Password
#exec /bin/bash /root/ovpn.sh $PASSWORD
#reboot for run this MTF
#reboot now
