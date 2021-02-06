#!/usr/bin/env bash

CMD="php -r 'echo phpversion().PHP_EOL;';\
test -x /usr/local/bin/composer1 && composer1 --version --ansi;\
test -x /usr/local/bin/composer2 && composer2 --version --ansi;\
test -x /usr/local/bin/symfony && /usr/local/bin/symfony version --ansi;\
test -x ~/.composer/vendor/bin/laravel && ~/.composer/vendor/bin/laravel --version --ansi;\
test -x /usr/local/bin/phpunit && /usr/local/bin/phpunit --version"

for ver in 5.6 7.0 7.1 7.2 7.3 7.4 8.0; do
  docker run \
    --rm \
    --name "dev-check-${ver}-cli" \
    "gander/dev:${ver}" \
    bash -c "${CMD}"
done
