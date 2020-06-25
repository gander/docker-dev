#!/usr/bin/env bash

VERSIONS=("7.4" "7.3" "7.2" "7.1" "7.0" "5.6")

NAME="gander/dev"

image_create() {
  if [ ! ${#} -eq 1 ]; then
    exit 1
  fi

  TAG="${NAME}:${1}"
  SRC="Dockerfile.${1/./}"

  if [ ! -e "${SRC}" ]; then
    exit 2
  fi

  image_build "${TAG}" "${SRC}"
  image_push "${TAG}"

  if [ "${1}" == "${VERSIONS[0]}" ]; then
    docker tag "${TAG}" "${NAME}:latest"
    image_push "${NAME}:latest"
  fi
}

image_build() {
  if [ ! ${#} -eq 2 ]; then
    exit 3
  fi

  echo
  echo "################################   BUILD   ${1}   ################################"
  echo

  docker build -t "${1}" -f "${2}" .
}

image_push() {
  if [ ! ${#} -eq 1 ]; then
    exit 4
  fi

  echo
  echo "################################   PUSH   ${1}   ################################"
  echo

  docker push "${1}"
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

echo "Done"
