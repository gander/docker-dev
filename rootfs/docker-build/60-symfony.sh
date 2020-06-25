#!/usr/bin/env bash

wget https://get.symfony.com/cli/installer -O - | bash &&
  mv /root/.symfony/bin/symfony /usr/local/bin/symfony &&
  mkdir -p ~dev/.symfony && chown dev:dev ~dev/.symfony
