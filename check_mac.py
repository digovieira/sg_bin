#!/usr/bin/python3

from tabulate import tabulate
import ipaddress as ip
import mysql.connector

connection = mysql.connector.connect(host='localhost', database='cpd', user='root', password='ca013976')
cursor = connection.cursor()
query = "select host,hostname,mac from hosts"
cursor.execute(query)
records = cursor.fetchall()

hosts = {}
for row in records:
	hosts[row[0]] = [row[1],row[2]]

table = []
for addr in ip.IPv4Network('192.168.1.0/24').hosts():
	ipaddr = str(addr).strip()
	if ipaddr in hosts:
		hostname = hosts[ipaddr][0]
		mac = hosts[ipaddr][1]
	else:
		hostname = "&nbsp;"
		mac = "&nbsp;"
	table.append([ipaddr,hostname,mac])

print(tabulate(table, headers=["IP", "hostname", "MAC"], tablefmt='unsafehtml'))
