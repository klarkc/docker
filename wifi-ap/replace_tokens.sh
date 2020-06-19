#!/bin/bash

RND_PW=`echo | awk 'BEGIN{srand();}  {printf "%.0f\n", rand()*1000000000000000000000000}'`
RND_SSID="dofi${RANDOM}"
cat /etc/hostapd/hostapd.conf  | sed "s/88888888/${CUSTOM_PW:-$RND_PW}/" | sed "s/dofi/${CUSTOM_SSID:-$RND_SSID}/" | sed "s/WLAN/${WLAN}/" > /etc/hostapd/hostapd.conf.2
mv /etc/hostapd/hostapd.conf.2 /etc/hostapd/hostapd.conf

cat /etc/network/interfaces  | sed "s/WLAN/${WLAN}/" > /etc/network/interfaces.2
mv /etc/network/interfaces.2 /etc/network/interfaces

cat /etc/iptables.ipv4.nat  | sed "s/WLAN/${WLAN}/" | sed "s/LAN/${LAN}/" > /etc/iptables.ipv4.nat.2
mv /etc/iptables.ipv4.nat.2 /etc/iptables.ipv4.nat


