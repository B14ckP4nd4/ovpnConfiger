#!/bin/bash

# stop untile network working
until ping -c1 www.google.com >/dev/null 2>&1; do sleep 5; done

# remove all cronJobs and start Cronjobs
crontab -r

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
echo "IP=$(wget -qO- http://ipecho.net/plain | xargs echo)" >> /etc/telegram.sh.conf
PATH=$PATH:/etc/telegram.sh

PASSWORD=${3}

export PATH

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
until ping -c1 www.google.com >/dev/null 2>&1; do sleep 5; done
source /etc/telegram.sh.conf

if [ ! -f /home/ovpn/client/client-udp-1194.ovpn ]; then
    exit 0
fi


cp /home/ovpn/client/client-udp-1194.ovpn /root/${IP}-${HOSTNAME}.ovpn

crontab -u root -l | grep -v '* * * * * . /root/telegram-config-sender.sh'  | crontab -u root -

rm -rf $0

. /etc/telegram.sh/telegram -f /root/${IP}-${HOSTNAME}.ovpn -H "<b>[ ✅ Server Configuration completed successfully ]</b> "$'\n\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"
. /etc/telegram.sh/telegram -H "<b>[ ✅ Server Configuration completed successfully ]</b> "$'\n\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"


EOT

{ crontab -l; echo "* * * * * . /root/telegram-config-sender.sh"; } | crontab -

# remove it
rm -rf $0

# download configurator
wget https://git.io/JtLfM -O /root/ovpn.sh

# set permitions
chmod +x /root/ovpn.sh

# run it with Password
. /root/ovpn.sh $PASSWORD
