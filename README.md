# public_wan_asus_jffs
# Purpose: Always get public wan ip on digi pppoe 

Merlin and Entware required
```sh
opkg update
opkg install bind-dig

chmod a+rx /jffs/scripts/init-start
chmod a+rx /jffs/scripts/cron_wan_public.sh
```
