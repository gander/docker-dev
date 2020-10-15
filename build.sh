#!/usr/bin/env bash

set -e

VERSIONS=("7.4" "7.3" "7.2" "7.1" "7.0" "5.6" "8.0-rc")

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

  if [ "${1}" == "${VERSIONS[0]}" ]; then
    docker tag "${TAG}" "${NAME}:latest"
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

images_pull() {
  for VER in "${@}"; do
    echo
    echo "################################   PULL   php:${VER}-apache   ################################"
    echo

    docker pull "php:${VER}-apache"
  done
}

images_create() {
  for VER in "${@}"; do
    image_create "${VER}"

    if [ "${VER}" == "${VERSIONS[0]}" ]; then
      docker tag "${NAME}:${VER}" "${NAME}:latest"
    fi
  done
}

images_push() {
  for VER in "${@}"; do
    if [ "${VER}" == "${VERSIONS[0]}" ]; then
      image_push "${NAME}:latest"
    fi

    image_push "${NAME}:${VER}"
  done
}

if [ ${#} -gt 0 ]; then
  images_pull "${@}"
  images_create "${@}"
  images_push "${@}"
else
  images_pull "${VERSIONS[@]}"
  images_create "${VERSIONS[@]}"
  images_push "${VERSIONS[@]}"
fi

echo "Done"
