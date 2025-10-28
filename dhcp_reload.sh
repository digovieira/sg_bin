#!/bin/sh
sudo /usr/local/bin/dhcpgen /etc/dhcp/
sudo /usr/local/bin/firewallgen /var/www/sistemas/bin/ 
sudo systemctl restart firewall.service
sudo systemctl restart dhcpd.service
sudo journalctl _COMM=firewall -o cat --no-pager --since -1m 
sudo journalctl _COMM=dhcpd -o cat --no-pager --since -1m 
exit 0

