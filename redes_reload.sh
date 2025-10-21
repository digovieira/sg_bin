#!/bin/sh
sudo /usr/local/bin/dhcpgen /etc/dhcp/
sudo /usr/local/bin/hostsgen /var/www/sistemas/bin/
sudo /usr/local/bin/subnetsgen /var/www/sistemas/bin/ 
sudo /usr/local/bin/routesgen /var/www/sistemas/bin/
sudo /var/www/sistemas/bin/sgipset.subnets
sudo /var/www/sistemas/bin/firewall
sudo systemctl restart dhcpd
echo Regras ativadas com sucesso!
exit 0

