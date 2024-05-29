#!/bin/sh
# Purpose: Always get public wan ip on digi pppoe
echo 'starting wan script ' `date` >> log.txt
service restart_ddns
sleep 15s

#CHECK 1
ASUS_IP=$(dig +short madalinost.asuscomm.com | tail -1)
echo 'asuscomm.com: ' $ASUS_IP >> log.txt

#CHECK 2
#WAN_IP=$(dig +short madalinost.go.ro | tail -1)
WAN_IP=$(nvram get wan0_ipaddr)
echo 'router_wan: ' $WAN_IP >> log.txt


#CHECK 3
ICANHAZIP=$(curl https://icanhazip.com/)
echo 'icanhazip.com: ' $ICANHAZIP >> log.txt

if [ "$ASUS_IP" != "$WAN_IP" ]; 
then echo 'asuscomm not matched' >> log.txt

    if [ "$ICANHAZIP" != "$WAN_IP" ]; 
    then echo 'icanhazip not matched' >> log.txt

    echo 'IP IS STILL NOT PUBLIC' >> log.txt
    service restart_wan

    else
    echo 'ip is still public' >> log.txt

    fi

else
echo 'ip is public' >> log.txt

fi

echo 'ending wan script ' `date` >> log.txt

#CLEANUP
LINES_COUNTER=$(grep -c "^" log.txt)
if [ "$LINES_COUNTER" -gt 35 ]; 
then rm log.txt
echo 'Logs cleaned after ' $LINES_COUNTER ' rows' >>log.txt
else echo 'Autocleanup not needed. Lines: ' $LINES_COUNTER  >>log.txt
fi
