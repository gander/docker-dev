#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ ${#} -gt 0 ]; then

  for ver in "$@"; do
    curl -LsS "https://phar.phpunit.de/phpunit-${ver}.phar" -o "/usr/local/bin/phpunit${ver}"
    chmod +x "/usr/local/bin/phpunit${ver}"
  done

  ln -s "/usr/local/bin/phpunit${ver}" "/usr/local/bin/phpunit"

fi
