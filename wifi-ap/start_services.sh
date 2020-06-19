#!/bin/bash

sysctl -w net.ipv4.ip_forward=1
rfkill block wifi
rfkill unblock wifi
/opt/replace_tokens.sh
ifup $WLAN
cat /etc/iptables.ipv4.nat
iptables-restore < /etc/iptables.ipv4.nat
/etc/init.d/dnsmasq start
echo
echo Here are your Docker WiFi credentials:
egrep '(^ssid|pass)' /etc/hostapd/hostapd.conf
echo
/usr/sbin/hostapd -P /run/hostapd.pid /etc/hostapd/hostapd.conf

