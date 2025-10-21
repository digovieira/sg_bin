# !/bin/sh
/usr/lib64/nagios/plugins/check_ping -H $1 -w 10,20% -c 100,50% -p 1 | awk '{print $2}'
