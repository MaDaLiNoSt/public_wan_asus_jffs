#!/bin/sh
# Purpose: Always get public wan ip on digi pppoe
service restart_ddns
sleep 15s
ASUS_IP=$(dig +short madalinost.asuscomm.com | tail -1)
echo $ASUS_IP

#WAN_IP=$(dig +short madalinost.go.ro | tail -1)
WAN_IP=$(nvram get wan0_ipaddr)
echo $WAN_IP

if [ "$ASUS_IP" != "$WAN_IP" ]; 

then
echo 'IP IS NOT PUBLIC'
service restart_wan

else
echo 'ip is public'

fi

