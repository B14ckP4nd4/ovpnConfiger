#!/bin/bash

# wait for network
until ping -c1 www.google.com >/dev/null 2>&1; do sleep 5; done

set -ex

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/etc/telegram.sh
source /etc/telegram.sh.conf

PROTOCOL=$1
PROFILE_PATH=$2

if [[ -f "/root/${PROTOCOL}-sent" ]]; then

    # disable cronjob
    crontab -u root -l | grep -v "* * * * * /bin/bash /root/telegram-sender.sh ${PROTOCOL} ${PROFILE_PATH}"  | crontab -u root -

    exit 1
fi

count=$(ls -1 ${PROFILE_PATH}/client/*.ovpn 2>/dev/null | wc -l)

if [ $count != 0 ] && [ ! -f "/root/${PROTOCOL}-sent" ]; then
    
    CONF_NAME=$( ls  ${PROFILE_PATH}/client/ | grep .ovpn | awk 'END{print $1}' )

    cp ${PROFILE_PATH}/client/${CONF_NAME} /root/${HOSTNAME}-${IP}-${PROTOCOL}.ovpn

    echo \"1\" > /root/${PROTOCOL}-sent

    TAG="🔴 TCP Protocol "
    
    if [[ $PROTOCOL = 'udp' ]]; then
        TAG="🔵 UDP Protocol "
    fi

    # send them to telegram
    exec /bin/bash telegram -f /root/${HOSTNAME}-${IP}-${PROTOCOL}.ovpn -H "<b>[ ✅ Connection is Ready! ]</b> "$'\n\n'"${TAG} "$'\n'"⚡️ Server IP : ${IP} "$'\n'"⚡️ SERVER HOSTNAME : <b>${HOSTNAME}</b>"
fi