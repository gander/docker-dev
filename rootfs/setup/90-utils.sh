#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

RELEASE=$(curl https://api.github.com/repos/fabpot/local-php-security-checker/releases/latest | jq --raw-output '.assets[]?|.browser_download_url|select(endswith("_linux_amd64"))')

if [ -n "${RELEASE}" ]; then
  curl --retry-all-errors --retry 3 -LsS "${RELEASE}" -o "/usr/local/bin/local-php-security-checker"
  chmod +x "/usr/local/bin/local-php-security-checker"
fi

if [[ ! $(php -r 'echo PHP_VERSION;') < '7.4.0' ]]; then
  curl -LsS https://github.com/composer-unused/composer-unused/releases/latest/download/composer-unused.phar -o /usr/local/bin/composer-unused
  chmod +x /usr/local/bin/composer-unused
fi
