#!/bin/sh
snmpwalk -v 1 -c public $1 sysName | awk -F ":" '{printf"<h2>%s - ", $4}'
snmpwalk -v 1 -c public $1 sysDescr | awk -F ":" '{printf"%s</h2>", $4}'
echo "<h3>$1</h3>"
echo "<table  border='1' class='KT_tngtable'><tr>"
echo "<th>Interface #</th>"
snmpwalk -v 1 -c public $1 ifDescr | awk -F " " '{printf"<th>%s</th>",substr ($1,17,4)}'
echo "</tr><tr>"
echo "<th>Nome:</th>"
snmpwalk -v 1 -c public $1 ifDescr | awk -F " " '{printf"<td>%s", $4}'
echo "</tr><tr>"
echo "<th>Tipo:</th>"
snmpwalk -v 1 -c public $1 ifType | awk -F " " '{printf"<td>%s", $4}'
echo "</tr><tr>"
echo "<th>Status:</th>"
snmpwalk -v 1 -c public $1 ifOperStatus | awk -F " " '{printf"<td>%s", $4}'
echo "</tr><tr>"
echo "<th>Bytes rec.:</th>"
snmpwalk -v 1 -c public $1 ifInOctets | awk -F " " '{printf"<td>%s", $4}'
echo "</tr><tr>"
echo "<th>Bytes env.:</th>"
snmpwalk -v 1 -c public $1 ifOutOctets | awk -F " " '{printf"<td>%s", $4}'
echo "</tr><table>"

