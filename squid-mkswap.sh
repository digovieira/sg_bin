#!/bin/bash
/usr/bin/mkdir -p /var/run/squid
/usr/bin/chown  squid.squid  /var/run/squid
/usr/libexec/squid/cache_swap.sh
