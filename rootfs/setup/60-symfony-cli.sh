#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list &&
  apt update &&
  apt install symfony-cli
