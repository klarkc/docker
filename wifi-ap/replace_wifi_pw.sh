#!/bin/bash

RND_PW=`echo | awk 'BEGIN{srand();}  {printf "%.0f\n", rand()*1000000000000000000000000}'`
RND_SSID="dofi${RANDOM}"
cat /etc/hostapd/hostapd.conf | sed "s/88888888/${CUSTOM_PW:-$RND_PW}/" | sed "s/dofi/${CUSTOM_SSID:-$RND_SSID}/" > /etc/hostapd/hostapd.conf.2
mv /etc/hostapd/hostapd.conf.2 /etc/hostapd/hostapd.conf

