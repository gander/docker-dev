#!/usr/bin/env bash

VERSIONS=("7.4" "7.3" "7.2" "7.1" "7.0" "5.6")

image_create() {
  if [ ! ${#} -eq 1 ]; then
    exit 1
  fi

  screen -m -d ./build.sh "${1}"
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
