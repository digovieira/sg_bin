# !/bin/sh
H=`/usr/sbin/fping -i 10 -r 0 -t 100 $1 | awk '{print $3}'`
if [ -z $2 ]; then
        T="0"
else
        T=$2
fi

if [ $H = 'alive' ]; then
        MAC=`env LANG=C /sbin/arp -a $1 | awk '{print $4}'`
	M=${MAC:0:17}
        P=`nmap -p5800 -P0 $1 | grep vnc | awk '{print $2}'`
        declare -l HN=`env LANG=C nmblookup -A $1 | grep '<20>' | awk '{print $1}'`
        if [ $P = 'open' ]; then
                VNC="<a href='http://$1:5800' target='_BLANK'><img src='../images/ico_vnc.jpg' border=0 align="absmiddle" hspace=2 vspace=2 /></a>"
        fi
        if [ `echo $M | tr '[A-Z]' '[a-z]'` = `echo $T | tr '[A-Z]' '[a-z]'` ]; then
                echo "<img src='../images/status1.gif' align="absmiddle" hspace=2 vspace=2 /><font color='#006600'>"${M^^}"</font>"$VNC
        else
                if [ $T = "0" ]; then
                        echo "<img src='../images/status1.gif' align="absmiddle" hspace=2 vspace=2 /><font color='#AA0000'>"${M^^}" </font><a href='../proxy/hosts_pop_ins.php?ip="$1"&mac="$M"&hostname="$HN"' target='_BLANK'><img src='../images/ico_host-add.png' border='0' align='absmiddle' alt='adiciona host' title='adiciona host' /></a>"$VNC
                else
                        echo "<img src='../images/status1.gif' align="absmiddle" hspace=2 vspace=2 /><font color='#AA0000'>"${M^^}" </font><a href='../proxy/hosts_pop_upd.php?cod="$3"&mac="$M"&hostname="$HN"' target='_BLANK'><img src='../images/ico_editar.gif' border='0' align='absmiddle' alt='corrige host' title='corrige host' /></a>"$VNC
                fi
        fi
else
        echo "<img src='../images/status3.gif' align="absmiddle" hspace=2 vspace=2 /><font color='#000000'>"$2"</font>"
fi
