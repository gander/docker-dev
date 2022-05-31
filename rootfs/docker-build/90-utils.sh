#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

ver=1.1.1

curl -LsS "https://github.com/fabpot/local-php-security-checker/releases/download/v${ver}/local-php-security-checker_${ver}_linux_amd64" -o "/usr/local/bin/local-php-security-checker"
chmod +x "/usr/local/bin/local-php-security-checker"
