#!/usr/bin/env bash

image_build()
{
  echo
  echo "################################   BUILD   ${1}   ################################"
  echo

  docker build -t "${1}" -f "${2}" .
}

image_push()
{
  echo
  echo "################################   PUSH   ${1}   ################################"
  echo

  docker push "${1}"
}

VERSIONS=("5.6" "7.0" "7.1" "7.2" "7.3" "7.4")

NAME="gander/dev"

for VER in "${VERSIONS[@]}"; do
  TAG="${NAME}:${VER}"
  SRC="Dockerfile.${VER/./}"

  image_build "${TAG}" "${SRC}"
  image_push "${TAG}"
done

docker tag "${TAG}" "${NAME}:latest"
image_push "${NAME}:latest"

docker tag "${TAG}" "${NAME}:7"
image_push "${NAME}:7"

docker tag "${NAME}:5.6" "${NAME}:5"
image_push "${NAME}:5"

echo "Done"
