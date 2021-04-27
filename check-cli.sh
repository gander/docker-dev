#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

commands=(
  "php -r 'echo phpversion().PHP_EOL;';"
  "(test -x /usr/local/bin/composer1 && composer1 --version --ansi || true);"
  "(test -x /usr/local/bin/composer2 && composer2 --version --ansi || true);"
  "(test -x /usr/local/bin/symfony && /usr/local/bin/symfony version --ansi || true);"
  "(test -x ~/.composer/vendor/bin/laravel && ~/.composer/vendor/bin/laravel --version --ansi || true);"
  "(test -x /usr/local/bin/phpunit9 && /usr/local/bin/phpunit9 --version || true);"
  "(test -x /usr/local/bin/phpunit8 && /usr/local/bin/phpunit8 --version || true);"
  "(test -x /usr/local/bin/phpunit7 && /usr/local/bin/phpunit7 --version || true);"
  "(test -x /usr/local/bin/phpunit6 && /usr/local/bin/phpunit6 --version || true);"
  "(test -x /usr/local/bin/phpunit5 && /usr/local/bin/phpunit5 --version || true);"
  "(test -x /usr/local/bin/phpunit4 && /usr/local/bin/phpunit4 --version || true)"
)

for ver in 5.6 7.0 7.1 7.2 7.3 7.4 8.0; do
  docker rm \
    --force \
    "dev-check-${ver}-cli" \
    >/dev/null 2>&1

  docker run \
    --rm \
    --name "dev-check-${ver}-cli" \
    --detach \
    "gander/dev:${ver}" \
    >/dev/null

  for command in ${!commands[*]}; do
    result=$(
      docker exec \
        --interactive \
        --tty \
        "dev-check-${ver}-cli" \
        bash -c "${commands[$command]}" | xargs
    )

    if [ -n "${result}" ]; then
      echo "${result}"
    fi

  done

  docker rm \
    --force \
    "dev-check-${ver}-cli" \
    >/dev/null

  echo
done
