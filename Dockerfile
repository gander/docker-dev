ARG PHP_VERSION=8.2

FROM php:${PHP_VERSION}-apache

ARG PHP_VERSION

ARG XDEBUG_EXTENSION=xdebug-^3.2
ARG XDEBUG_CONFIG_FILE=config/xdebug3.ini

ARG PHP_EXTENSIONS=bcmath-stable,gd-stable,intl-stable,pcntl-stable,pdo_mysql-stable,pdo_pgsql-stable,zip-stable
ARG PHP_EXTENSIONS_ADD

ARG PHPUNIT_VERSIONS=8,9,10

ARG USE_ARCHIVE

ARG DEV_USER_UID=1000
ENV TERM=xterm-256color

RUN if [ "${USE_ARCHIVE}" -eq "1" ]; then sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list; fi
RUN if [ "${USE_ARCHIVE}" -eq "1" ]; then sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list; fi
RUN if [ "${USE_ARCHIVE}" -eq "1" ]; then sed -i '/stretch-updates/d' /etc/apt/sources.list; fi

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    bc \
    command \
    cron \
    curl \
    git \
    htop \
    jq \
    nano \
    openssh-client \
    screen \
    ssl-cert \
    sudo \
    unzip \
    wget

RUN /usr/sbin/update-ca-certificates

ADD rootfs /

RUN (bash /setup/00-user.sh) && \
    (bash /setup/10-bash.sh) && \
    (bash /setup/20-apache.sh) && \
    (bash /setup/30-php.sh $(echo ${PHP_EXTENSIONS} | tr "," " ") $(echo ${PHP_EXTENSIONS_ADD} | tr "," " ") ${XDEBUG_EXTENSION})

RUN (bash /setup/50-composer.sh) && \
    (bash /setup/60-symfony$([ $(echo "${PHP_VERSION} > 7.0" | bc -l) -eq 1 ] && echo "-cli").sh) && \
    (bash /setup/70-phpunit.sh $(echo ${PHPUNIT_VERSIONS} | tr "," " ")) && \
    (bash /setup/90-utils.sh) && \
    (rm -fr /setup/)

RUN rm -rf /var/lib/apt/lists/*

ADD ${XDEBUG_CONFIG_FILE} /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

USER dev

VOLUME /www
WORKDIR /www

EXPOSE 80
EXPOSE 443

CMD ["sudo", "apache2-foreground"]
