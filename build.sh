#!/usr/bin/env bash

VERSIONS=( "5.6" "7.0" "7.1" "7.2" "7.3" "7.4-rc" )

docker login -u gander

NAME="gander/dev"

for VER in "${VERSIONS[@]}"
do
    TAG="${NAME}:${VER}"
    SRC="Dockerfile.${VER/./}"

    docker build -t "${TAG}" -f "${SRC}" . && docker push "${TAG}"
done

docker tag "${NAME}:7.3" "${NAME}:latest" && docker push "${NAME}:latest"
docker tag "${NAME}:7.3" "${NAME}:7" && docker push "${NAME}:7"
docker tag "${NAME}:5.6" "${NAME}:5" && docker push "${NAME}:5"
