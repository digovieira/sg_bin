#!/bin/sh
sudo /usr/local/bin/firewallgen /var/www/sistemas/bin/ 
sudo /var/www/sistemas/bin/sgipset.block
sudo /var/www/sistemas/bin/sgipset.msn
sudo /var/www/sistemas/bin/sgipset.proxy
sudo /var/www/sistemas/bin/sgipset.range
sudo /var/www/sistemas/bin/sgipset.subnets
sudo /var/www/sistemas/bin/sgipset.amazon
sudo /var/www/sistemas/bin/firewall 
sudo systemctl restart squid
sudo systemctl restart dhcpd
echo Regras ativadas com sucesso!
exit 0

