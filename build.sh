#!/usr/bin/env bash

docker login

for dir in $(ls -d */)
do
    ver=${dir%%/}
    echo ">>> ${ver} >>>"
    docker build -t gander/php-apache-dev:${ver} ./${dir}
    docker push gander/php-apache-dev:${ver}
done

