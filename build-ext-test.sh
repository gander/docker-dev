#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

VER=${1}

cat <<EOF | docker build --pull --rm --tag "gander/dev:${VER}-test" -
  FROM php:${VER}
  RUN apt-get update && apt-get upgrade -y
  ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
  RUN chmod +x /usr/local/bin/install-php-extensions
  RUN sync
EOF

shift

PASS=()
FAIL=()

for EXT in "${@}"; do
  docker run \
    --rm \
    --name "gander-dev-${VER}-test-ext" \
    "gander/dev:${VER}-test" \
    bash -c "install-php-extensions ${EXT}" &&
    PASS+=("${EXT}") || FAIL+=("${EXT}")
done

docker image rm --force gander/dev:test

echo
echo "===   ${VER}   ==="
echo
echo PASS: "${PASS[@]}"
echo FAIL: "${FAIL[@]}"
echo

