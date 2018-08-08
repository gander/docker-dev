#!/usr/bin/env bash

VERSIONS=( "5.6" "7.0" "7.1" "7.2" )

docker login

NAME="gander/dev"

for VER in "${VERSIONS[@]}"
do
    TAG="${NAME}:${VER}"
    SRC="Dockerfile.${VER/./}"

    docker build -t "${TAG}" -f "${SRC}" . && docker push "${TAG}"
done

LATEST="${NAME}:latest";

docker tag "${TAG}" "${LATEST}" && docker push "${LATEST}"
