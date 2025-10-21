# !/bin/sh
H=`nmap -p5800 $1 | grep vnc | awk '{print $2}'`
if [ "$H" = "open" ] ; then
	echo "<a href='http://$1:5800' target='_BLANK'><img src='../images/ico_vnc.jpg' border=0 /></a>"
else
	echo "&nbsp;"
fi 

