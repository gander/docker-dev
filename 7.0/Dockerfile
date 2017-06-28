FROM php:7.0-apache

ARG DEV_UID=1000

MAINTAINER Adam Gąsowski <adam.gasowski@gander.pl>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    openssh-client \
    postgresql-client \
    mysql-client \
    sudo \
    git \
    wget \
    curl \
    nano \
    libicu-dev \
    libmcrypt-dev \
    libpq-dev \
    libpng12-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libxslt-dev \
    libtidy-dev \
    --no-install-recommends \
    && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install bcmath \
    && docker-php-ext-install gd \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install sockets \
    && docker-php-ext-install zip \
    && docker-php-ext-install soap \
    && pecl install xdebug

# COPY CONFIGS
COPY php.ini /usr/local/etc/php/
COPY xdebug.ini /usr/local/etc/php/conf.d/
COPY vhost-alias.conf /etc/apache2/conf-available/

# INSTALL COMPOSER
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# INSTALL SYMFONY
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && chmod a+x /usr/local/bin/symfony

# INSTALL PHPUNIT 5.7
RUN curl -LsS https://phar.phpunit.de/phpunit-5.7.phar -o /usr/local/bin/phpunit5 && chmod +x /usr/local/bin/phpunit5

# INSTALL PHPUNIT 6.0
RUN curl -LsS https://phar.phpunit.de/phpunit-6.2.phar -o /usr/local/bin/phpunit6 && chmod +x /usr/local/bin/phpunit6

RUN ln -s /usr/local/bin/phpunit5 /usr/local/bin/phpunit

# ENABLE CONFIGS
RUN a2enmod rewrite && a2enmod vhost_alias && a2enconf vhost-alias

# SET ALIASES
RUN printf "alias l='ls -CF'\nalias la='ls -A'\nalias ll='ls -alF'\n" >> /etc/bash.bashrc

#RUN printf "\nexport TERM=xterm\n" >> /etc/bash.bashrc
RUN printf "if [ -d \"\$HOME/.composer/vendor/bin\" ]; then\n    PATH=\"\$HOME/.composer/vendor/bin:\$PATH\"\nfi" >> /etc/bash.bashrc

# ADD DEV USER
RUN adduser --disabled-password --gecos '' --uid ${DEV_UID} dev \
    && adduser dev sudo \
    && printf "dev ALL=(ALL) NOPASSWD: ALL\n" > /etc/sudoers.d/dev

# SET APACHE USER
RUN printf "export APACHE_RUN_USER=dev\nexport APACHE_RUN_GROUP=dev\n" >> /etc/apache2/envvars

# SET APACHE FILES OWNER
RUN chown -R dev:dev /var/lock/apache2 /var/log/apache2

USER dev

VOLUME /www
WORKDIR /www
EXPOSE 80

CMD ["sudo", "apache2-foreground"]
