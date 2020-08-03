#!/bin/sh

EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

# shellcheck disable=SC2039
if [[ "${EXPECTED_SIGNATURE}" != "${ACTUAL_SIGNATURE}" ]]; then
  echo >&2 'ERROR: Invalid installer signature'
  rm composer-setup.php
  exit 1
fi

php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer &&
  php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer2 --version=2.0.0-alpha3 &&
  ln -s /usr/local/bin/composer /usr/local/bin/composer1
RESULT=$?

rm composer-setup.php

if [ $RESULT -eq 0 ]; then
  printf "if [ -d \"\$HOME/.composer/vendor/bin\" ]; then\n    PATH=\"\$HOME/.composer/vendor/bin:\$PATH\"\nfi\n" >>/etc/bash.bashrc
fi

exit ${RESULT}
