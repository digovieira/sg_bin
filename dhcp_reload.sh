#!/bin/sh
sudo /usr/local/bin/dhcpgen /etc/dhcp/
sudo /usr/local/bin/firewallgen /var/www/sistemas/bin/ 
sudo /var/www/sistemas/bin/sgipset.range
sudo systemctl restart dhcpd
echo Regras ativadas com sucesso!
exit 0

