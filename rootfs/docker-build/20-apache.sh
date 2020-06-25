#!/usr/bin/env bash

{
  echo export APACHE_RUN_USER=dev
  echo export APACHE_RUN_GROUP=dev
} >>/etc/apache2/envvars

chown -R dev:dev /www /var/lock/apache2 /var/log/apache2

a2enmod rewrite &&
  a2enmod vhost_alias &&
  a2enconf vhost-alias
