#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

RELEASE=$(curl https://api.github.com/repos/fabpot/local-php-security-checker/releases/latest | jq --raw-output '.assets[]|.browser_download_url|select(endswith("_linux_amd64"))')

if [ -n "${RELEASE}" ]; then
  curl -LsS "${RELEASE}" -o "/usr/local/bin/local-php-security-checker"
  chmod +x "/usr/local/bin/local-php-security-checker"
fi
