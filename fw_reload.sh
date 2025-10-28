#!/bin/sh
sudo /usr/local/bin/firewallgen /var/www/sistemas/bin/
sudo systemctl restart firewall.service
sudo systemctl restart squid.service
journalctl _COMM=firewall -o cat --no-pager --since -1m
echo Regras ativadas com sucesso!
exit 0

