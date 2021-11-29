#!/bin/bash

printenv | cat - >/tmp/crontab

if [ -f /www/crontab ]; then
  cat /www/crontab >>/tmp/crontab
fi

crontab /tmp/crontab

# cron service with SIGTERM support
sudo service cron start
trap "sudo service cron stop; exit" SIGINT SIGTERM

# just dump your logs to std output
tail -f /dev/null &
wait $!
