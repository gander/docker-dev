#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd /tmp || exit

mkcert localhost || exit

for ver in 5.6 7.0 7.1 7.2 7.3 7.4 8.0; do
  docker run \
    --rm \
    --name "dev-check-${ver}-ssl" \
    -p 80:80 \
    -p 443:443 \
    -v "${PWD}/localhost.pem:/etc/ssl/certs/ssl-cert-snakeoil.pem:ro" \
    -v "${PWD}/localhost-key.pem:/etc/ssl/private/ssl-cert-snakeoil.key:ro" \
    "gander/dev:${ver}"
done

rm ./localhost.pem ./localhost-key.pem
