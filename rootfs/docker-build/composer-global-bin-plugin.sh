#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ ${#} -gt 1 ]; then
  ns=${1}
  shift

  for pak in "$@"; do
    composer global bin "${ns}" config "allow-plugins.${pak}" "true"
    composer global bin "${ns}" require "${pak}"
  done
fi


