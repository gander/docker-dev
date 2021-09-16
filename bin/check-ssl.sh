#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd /tmp || exit

mkcert localhost || exit

for ver in 5.6 7.0 7.1 7.2 7.3 7.4 8.0 8.1-rc; do
  docker rm \
    --force \
    "dev-check-${ver}-ssl" \
    >/dev/null 2>&1

  docker run \
    --rm \
    --name "dev-check-${ver}-ssl" \
    --detach \
    -p 80:80 \
    -p 443:443 \
    -v "${PWD}/localhost.pem:/etc/ssl/certs/ssl-cert-snakeoil.pem:ro" \
    -v "${PWD}/localhost-key.pem:/etc/ssl/private/ssl-cert-snakeoil.key:ro" \
    "gander/dev:${ver}" \
    >/dev/null 2>&1

  echo -n "Starting dev-check-${ver}-ssl"
  for w in 1 2 3 4 5 6 7 8 9; do
    echo -n "."
    curl -sf http://localhost >/dev/null && break
    sleep 1
  done
  echo

  echo quit | openssl s_client -verify_quiet -showcerts -servername localhost -connect localhost:443 >./localhost-cacert.pem
  curl -sf --cacert ./localhost-cacert.pem https://localhost >/dev/null && echo "=> SSL TEST PASS" || echo "=> SSL TEST FAIL"

  echo "Removing dev-check-${ver}-ssl"

  docker rm \
    --force \
    "dev-check-${ver}-ssl" \
    >/dev/null 2>&1

  echo
  echo
done

rm ./localhost.pem ./localhost-key.pem ./localhost-cacert.pem
