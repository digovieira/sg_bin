#!/bin/sh
sudo /usr/local/bin/dhcpgen /etc/dhcp/
sudo /usr/local/bin/hostsgen /var/www/sistemas/bin/ 
sudo /var/www/sistemas/bin/sgipset.hosts
sudo systemctl restart dhcpd
sudo systemctl restart named
sudo systemctl restart squid
echo Regras ativadas com sucesso!
exit 0

