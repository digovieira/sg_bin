#!/bin/sh

mysqldump --add-drop-table -u cpd --password=ca013976 cpd > /backup/SG/cpd.sql
mysqldump --add-drop-table -u jabberd2 --password=ca013976 jabberd2 > /backup/SG/jabber.sql
mysqldump --add-drop-table -u imspector --password=imspector imspector > /backup/SG/imspector.sql
service named restart
cd /backup/SG
cp /root/config.h .
cp /etc/named.zones* .
cp /etc/named.trusted .
cp /etc/named.listen_ext .
cp /var/named/*.db .
cp /var/www/wpad/wpad.dat .
cd /etc
tar -czvf /backup/SG/openvpn.tar.gz openvpn
tar -czvf /backup/SG/squid.tar.gz squid
cd /usr/local/nagios
tar -czvf /backup/SG/nagios.tar.gz etc 
cd /usr/local/nagvis/
tar -czvf /backup/SG/nagvis.tar.gz etc/maps share/userfiles/images/ var

cd /backup/SG
ftp -in 66.7.212.57 < /etc/backup/nuvem.ftp
