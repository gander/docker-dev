FROM php:5.6-apache

ARG DEV_UID=1000

MAINTAINER Adam Gąsowski <adam.gasowski@gander.pl>

RUN apt-get update
RUN apt-get install -y \
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
    --no-install-recommends
RUN apt-get upgrade -y
RUN rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install gd
RUN docker-php-ext-install intl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install sockets
RUN docker-php-ext-install zip
RUN docker-php-ext-install soap

# COPY CONFIGS
COPY php.ini /usr/local/etc/php/
COPY xdebug.ini /usr/local/etc/php/conf.d/
COPY vhost-alias.conf /etc/apache2/conf-available/

# INSTALL COMPOSER
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# INSTALL SYMFONY
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# INSTALL PHPUNIT 4.8
RUN wget https://phar.phpunit.de/phpunit-4.8.phar -O /usr/local/bin/phpunit4
RUN chmod +x /usr/local/bin/phpunit4

# INSTALL PHPUNIT 5.7
RUN wget https://phar.phpunit.de/phpunit-5.7.phar -O /usr/local/bin/phpunit5
RUN chmod +x /usr/local/bin/phpunit5

RUN ln -s /usr/local/bin/phpunit5 /usr/local/bin/phpunit

# ENABLE CONFIGS
RUN a2enmod rewrite
RUN a2enmod vhost_alias
RUN a2enconf vhost-alias

# SET ALIASES
RUN printf "alias l='ls -CF'\n" >> /etc/bash.bashrc
RUN printf "alias la='ls -A'\n" >> /etc/bash.bashrc
RUN printf "alias ll='ls -alF'\n" >> /etc/bash.bashrc

#RUN printf "\nexport TERM=xterm\n" >> /etc/bash.bashrc
RUN printf "if [ -d \"\$HOME/.composer/vendor/bin\" ]; then\n    PATH=\"\$HOME/.composer/vendor/bin:\$PATH\"\nfi" >> /etc/bash.bashrc

# ADD DEV USER
RUN adduser --disabled-password --gecos '' --uid ${DEV_UID} dev
RUN adduser dev sudo
RUN printf "dev ALL=(ALL) NOPASSWD: ALL\n" > /etc/sudoers.d/dev

# SET APACHE USER
RUN printf "export APACHE_RUN_USER=dev\n" >> /etc/apache2/envvars
RUN printf "export APACHE_RUN_GROUP=dev\n" >> /etc/apache2/envvars

# SET APACHE FILES OWNER
RUN chown -R dev:dev /var/lock/apache2
RUN chown -R dev:dev /var/log/apache2

USER dev

VOLUME /www
WORKDIR /www
EXPOSE 80

CMD ["sudo", "apache2-foreground"]
