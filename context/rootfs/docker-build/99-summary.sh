#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

commands=(
  "php -r \"echo 'PHP:      '.phpversion();\""
  "php -r \"echo 'Zend:     '.zend_version();\""
  "php -r \"echo 'Xdebug:   '.(phpversion('xdebug') ?: '-');\""
  "(test -x /usr/local/bin/composer && composer --version --no-ansi || true)"
  "(test -x /usr/local/bin/symfony && /usr/local/bin/symfony version --no-ansi || true)"
  "(test -x ~/.composer/vendor/bin/laravel && ~/.composer/vendor/bin/laravel --version --no-ansi || true)"
  "(test -x /usr/local/bin/phpunit9 && /usr/local/bin/phpunit9 --version || true)"
  "(test -x /usr/local/bin/phpunit8 && /usr/local/bin/phpunit8 --version || true)"
  "(test -x /usr/local/bin/phpunit7 && /usr/local/bin/phpunit7 --version || true)"
  "(test -x /usr/local/bin/phpunit6 && /usr/local/bin/phpunit6 --version || true)"
  "(test -x /usr/local/bin/phpunit5 && /usr/local/bin/phpunit5 --version || true)"
  "(test -x /usr/local/bin/phpunit4 && /usr/local/bin/phpunit4 --version || true)"
)

echo
echo
echo "#############################   SUMMARY   #############################"
echo
for command in ${!commands[*]}; do
  result=$(bash -c "${commands[$command]}" | xargs)

  if [ -n "${result}" ]; then
    echo "${result}"
  fi

done
echo
if [ -x /usr/local/bin/composer ]; then
  echo "#######################   COMPOSER GLOBAL BIN   #######################"
  echo
  composer global bin all show -D
  echo
fi
echo "#######################################################################"
echo
echo
