#!/bin/sh
#IPEXT=`lynx --dump http://www.cyberciti.biz/files/what-is-my-ip-address.php | grep 'Your.*IP.add' | awk -F':' '{print $2}' | awk '{print $1}' `
IPEXT=`curl ifconfig.me/ip`
cd /tmp
rm -f lista
#wget --quiet "https://www.dan.me.uk/torlist/" -O lista
#wget --quiet "https://www.dan.me.uk/torlist/?exit" -O lista
wget --quiet "https://check.torproject.org/cgi-bin/TorBulkExitList.py?ip=$IPEXT&port=0" -O lista
sed -i '1,3d' /tmp/lista

ipset -exist create lista_tor hash:ip
ipset flush lista_tor
cat /tmp/lista | while read line
 do
   ipset add lista_tor $line
 done

