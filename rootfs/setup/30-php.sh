#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ ${#} -eq 0 ]; then
  exit 1
fi

curl -LsS -o /usr/local/bin/install-php-extensions https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions
chmod +x /usr/local/bin/install-php-extensions
sync

for package in "$@"; do
  echo
  echo "##########     Install PHP Extension: ${package}"
  echo

  install-php-extensions "${package}"

  echo
done
