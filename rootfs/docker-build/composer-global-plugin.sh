#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ ${#} -gt 0 ]; then

  for pak in "$@"; do
    composer global config "allow-plugins.${pak}" "true"
    composer global require "${pak}"
  done
fi


