#!/bin/sh
APP_NAME="$(basename $0)"
MESSAGE="script estava carregado. saindo..."
CURRENT_PID=$$
instances=$( ps --no-headers -C ${APP_NAME} )
out=$( echo "${instances}" | wc -l)

if [ $out -gt 1 ]; then
      if [ "${MESSAGE}X" != "X" ]; then
          echo "${MESSAGE}"
      fi
      exit 2
fi

echo "CALL maintenance();"|/usr/bin/mysql -u root --password=ca013976 mysar

