#!/bin/sh
sudo /usr/local/bin/dhcpgen /etc/dhcp/
sudo /usr/local/bin/hostsgen /var/www/sistemas/bin/
sudo /usr/local/bin/subnetsgen /var/www/sistemas/bin/ 
sudo /usr/local/bin/routesgen /var/www/sistemas/bin/
sudo systemctl restart firewall.service
sudo systemctl restart dhcpd.service
sudo journalctl _COMM=firewall -o cat --no-pager --since -1m 
sudo journalctl _COMM=dhcpd -o cat --no-pager --since -1m 
echo Regras ativadas com sucesso!
exit 0

