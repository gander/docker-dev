#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

wget https://get.symfony.com/cli/installer -O - | bash

/usr/bin/symfony version --no-ansi >> /var/www/html/versions.txt
