#!/usr/bin/env bash

if [ ${#} -gt 0 ]; then

  for pak in "$@"; do
    composer global require "${pak}"
  done
fi


