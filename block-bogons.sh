#!/bin/bash
# this is a prv8 ovpn configer
# Author : https://github.com/B14ckP4nd4

yes | yum install ipset

touch /etc/ipset.conf
chmod +x /etc/ipset.conf

sudo ipset create bogons nethash
sudo ipset --add bogons 0.0.0.0/8
sudo ipset --add bogons 10.0.0.0/8
sudo ipset --add bogons 100.64.0.0/10
sudo ipset --add bogons 127.0.0.0/8
sudo ipset --add bogons 127.0.53.53
sudo ipset --add bogons 169.254.0.0/16
sudo ipset --add bogons 172.16.0.0/12
sudo ipset --add bogons 192.0.0.0/24
sudo ipset --add bogons 192.0.2.0/24
sudo ipset --add bogons 192.168.0.0/16
sudo ipset --add bogons 198.18.0.0/15
sudo ipset --add bogons 198.51.100.0/24
sudo ipset --add bogons 203.0.113.0/24
sudo ipset --add bogons 224.0.0.0/4
sudo ipset --add bogons 240.0.0.0/4
sudo ipset --add bogons 255.255.255.255/32
sudo ipset save bogons > /etc/ipset.conf

sudo iptables -A INPUT -m set --match-set bogons src -j DROP
sudo iptables -A INPUT -m set --match-set bogons dst -j DROP
sudo iptables -A FORWARD -m set --match-set bogons src -j DROP
sudo iptables -A FORWARD -m set --match-set bogons dst -j DROP
iptables -S