VPN_IF1="tun0"
VPN_NET1="10.1.1.0/24"

export VPN_IF1 VPN_NET1

#ip route add $VPN_NET1   dev $VPN_IF1 table $WAN_T1
#ip route add 192.168.2.0/24 dev $VPN_IF1 via 10.1.1.2 table $WAN_T1
#ip route add 192.168.3.0/24 dev $VPN_IF1 via 10.1.1.2 table $WAN_T1

#$IPTABLES -t nat -A POSTROUTING -o $VPN_IF1 -j MASQUERADE
#$IPTABLES -t nat -A POSTROUTING -s $VPN_NET1 -o $LAN_IF1 -j MASQUERADE

$IPTABLES -t filter -A INPUT -i $VPN_IF1 -j ACCEPT
$IPTABLES -t filter -A FORWARD -i $VPN_IF1 -j ACCEPT
$IPTABLES -t filter -A FORWARD -o $VPN_IF1 -j ACCEPT
