#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
apt install symfony-cli

/usr/bin/symfony version >> /var/www/html/versions.txt
