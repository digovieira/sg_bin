# !/bin/sh
H=`/usr/sbin/fping -i 10 -r 0 -t 100 $1 | awk '{print $3}'`

if [ $H = 'alive' ]; then
        P=`nmap -p5800 -P0 $1 | grep vnc | awk '{print $2}'`
        if [ $P = 'open' ]; then
                echo "<img src='../images/status1.gif' /><a href='http://$1:5800' target='_BLANK'><img src='../images/ico_vnc.jpg' border=0 /></a>"
        else
                echo "<img src='../images/status1.gif' />"
        fi
else
        echo "<img src='../images/status3.gif' />"
fi

