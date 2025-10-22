#!/bin/sh
cd /usr/bin

$IPTABLES -A INPUT -i $LAN_IF1 -m set --match-set lista_tor dst -j LOG --log-prefix "F2B: =TorProject= "
$IPTABLES -A FORWARD -i $LAN_IF1 -m set --match-set lista_tor dst -j LOG --log-prefix "F2B: =TorProject= "
$IPTABLES -A FORWARD -i $LAN_IF1 -d 65.49.14.0/24 -j LOG --log-prefix "F2B: =UltraSurf= "
$IPTABLES -A FORWARD -i $LAN_IF1 -d 199.59.162.71 -j LOG --log-prefix "F2B: =Ares_Galaxy= "
$IPTABLES -A FORWARD -i $LAN_IF1 -d ares.net -j LOG --log-prefix "F2B: =Ares_Galaxy= "
$IPTABLES -A FORWARD -i $LAN_IF1 -d 98.143.146.7 -j LOG --log-prefix "F2B: =uTorrent= "
$IPTABLES -A FORWARD -i $LAN_IF1 -d update.bittorrent.com -j LOG --log-prefix "F2B: =uTorrent= "
$IPTABLES -A FORWARD -i $LAN_IF1 -m string --algo bm --string "BitTorrent" -j LOG --log-prefix "F2B: =uTorrent= "
$IPTABLES -A FORWARD -i $LAN_IF1 -m string --algo bm --string "peer_id=" -j LOG --log-prefix "F2B: =uTorrent= "
$IPTABLES -A FORWARD -i $LAN_IF1 -m string --algo bm --string "torrent" -j LOG --log-prefix "F2B: =uTorrent= "
$IPTABLES -A FORWARD -i $LAN_IF1 -m string --algo bm --string "announce" -j LOG --log-prefix "F2B: =uTorrent= "
#$IPTABLES -A FORWARD -i $LAN_IF1 -m string --algo bm --string "tracker" -j LOG --log-prefix "F2B: =uTorrent= "
$IPTABLES -A FORWARD -i $LAN_IF1 -m string --algo bm --string "find_node" -j LOG --log-prefix "F2B: =uTorrent= "
$IPTABLES -A FORWARD -i $LAN_IF1 -m string --algo bm --string "info_hash" -j LOG --log-prefix "F2B: =uTorrent= "
$IPTABLES -A FORWARD -i $LAN_IF1 -m string --algo bm --string "get_peers" -j LOG --log-prefix "F2B: =uTorrent= "

