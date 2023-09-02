#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

wget https://get.symfony.com/cli/installer -O - | bash

mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

/usr/local/bin/symfony version --no-ansi >> /var/www/html/versions.txt
