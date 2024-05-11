# public_wan_asus_jffs
# Purpose: Always get public wan ip on digi pppoe

Merlin and Entware required

opkg update
opkg install bind-dig

chmod a+rx /jffs/scripts/start_cron_wan_public
chmod a+rx /jffs/scripts/cron_wan_public.sh
