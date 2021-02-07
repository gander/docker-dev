#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

VERSIONS=("8.0" "7.4" "7.3" "7.2" "7.1" "7.0" "5.6")

image_create() {
  if [ ! ${#} -eq 1 ]; then
    exit 1
  fi

  screen -S "docker-build-${1}" -m -d ./build.sh "${1}"
}

if [ ${#} -gt 0 ]; then
  for VER in "${@}"; do
    image_create "${VER}"
  done
else
  for VER in "${VERSIONS[@]}"; do
    image_create "${VER}"
  done
fi
