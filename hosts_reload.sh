#!/bin/sh
sudo /usr/local/bin/dhcpgen /etc/dhcp/
sudo /usr/local/bin/hostsgen /var/www/sistemas/bin/ 
sudo systemctl restart firewall.service
sudo systemctl restart dhcpd.service
sudo systemctl restart named.service
sudo systemctl restart squid.service
sudo journalctl _COMM=firewall -o cat --no-pager --since -1m 
sudo journalctl _COMM=dhcpd -o cat --no-pager --since -1m 
echo Regras ativadas com sucesso!
exit 0

