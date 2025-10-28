#!/bin/bash

cd /
tar -czvf /backup/proxy/etc.tar.gz etc > /backup/proxy/etc.log
tar -czvf /backup/proxy/home.tar.gz home > /backup/proxy/home.log
cd /var/www
tar -czvf /backup/proxy/sistemas.tar.gz sistemas > /backup/proxy/sistemas.log
mysqldump --add-drop-table -u cpd --password=ca013976 cpd > /backup/proxy/cpd.sql
mysqldump --add-drop-table -u mysar --password=mysar mysar > /backup/proxy/mysar.sql

date > /backup/proxy/bak.log
