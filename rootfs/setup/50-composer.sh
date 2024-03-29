#!/bin/sh

EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
  echo >&2 'ERROR: Invalid installer checksum'
  rm composer-setup.php
  exit 1
fi

RESULT=0
php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer --stable || RESULT=$?
rm composer-setup.php

if [ $RESULT -eq 0 ]; then
  printf "if [ -d \"\$HOME/.composer/vendor/bin\" ]; then\n    PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"\nfi\n" >>/etc/bash.bashrc
  /usr/local/bin/composer --version --no-ansi >> /var/www/html/versions.txt
fi

exit $RESULT
