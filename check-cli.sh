#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

for ver in 5.6 7.0 7.1 7.2 7.3 7.4 8.0 8.1-rc; do
  docker run \
    --rm \
    --name "dev-check-${ver}-cli" \
    "gander/dev:${ver}" \
    bash -c "bash /docker-build/99-summary.sh"
  echo
done
