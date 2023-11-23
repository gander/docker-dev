# gander/dev

PHP, Apache, dev user (1000)

## Supported tags:

* `8.0`, `8.1`, `8.2`, `8.3`
* `7.0`, `7.1`, `7.2`, `7.3`, `7.4`
* `5.6`

#### Supports _"locally-trusted development certificates"_ generated by [mkcert](https://mkcert.dev/).

## Usage

| Container directory structure                  | Web path structure                        |
|------------------------------------------------|-------------------------------------------|
| `/www/{{domain}}/public/{{file}}`              | `http://{{domain}}/{{file}}`              |
| `/www/localhost/public/test.php`               | `http://localhost/test.php`               |
| `/www/example.localhost/public/index.php`      | `http://example.localhost/index.php`      |
| `/www/example.localhost/public/test/index.php` | `http://example.localhost/test/index.php` |

+ [Examples](./examples/README.md)

## Build

```shell
docker build \
    --tag gander/dev:8.3 \
    --build-arg PHP_VERSION=8.3 \
    --build-arg XDEBUG_EXTENSION=xdebug-^3.3 \
    --build-arg XDEBUG_CONFIG_FILE=config/xdebug3.ini \
    --build-arg PHPUNIT_VERSIONS=8,9,10 \
    .
```

```shell
docker build \
    --tag gander/dev:8.2 \
    --build-arg PHP_VERSION=8.2 \
    --build-arg XDEBUG_EXTENSION=xdebug-^3.2 \
    --build-arg XDEBUG_FILE=config/xdebug3.ini \
    --build-arg PHPUNIT_VERSIONS=8,9,10 \
    .
```

```shell
docker build \
    --tag gander/dev:8.1 \
    --build-arg PHP_VERSION=8.1 \
    --build-arg XDEBUG_EXTENSION=xdebug-^3.2 \
    --build-arg XDEBUG_FILE=config/xdebug3.ini \
    --build-arg PHP_EXTENSIONS_ADD=mcrypt-stable \
    --build-arg PHPUNIT_VERSIONS=8,9,10 \
    .
```

```shell
docker build \
    --tag gander/dev:8.0 \
    --build-arg PHP_VERSION=8.0 \
    --build-arg XDEBUG_EXTENSION=xdebug-^3.2 \
    --build-arg XDEBUG_FILE=config/xdebug3.ini \
    --build-arg PHP_EXTENSIONS_ADD=mcrypt-stable \
    --build-arg PHPUNIT_VERSIONS=8,9 \
    .
```

```shell
docker build \
    --tag gander/dev:7.4 \
    --build-arg PHP_VERSION=7.4 \
    --build-arg XDEBUG_EXTENSION=xdebug-^3.1 \
    --build-arg XDEBUG_FILE=config/xdebug3.ini \
    --build-arg PHP_EXTENSIONS_ADD=mcrypt-stable \
    --build-arg PHPUNIT_VERSIONS=8,9 \
    .
```

```shell
docker build \
    --tag gander/dev:7.3 \
    --build-arg PHP_VERSION=7.3 \
    --build-arg XDEBUG_EXTENSION=xdebug-^3.1 \
    --build-arg XDEBUG_FILE=config/xdebug3.ini \
    --build-arg PHP_EXTENSIONS_ADD=mcrypt-stable \
    --build-arg PHPUNIT_VERSIONS=7,8,9 \
    .
```

```shell
docker build \
    --tag gander/dev:7.2 \
    --build-arg PHP_VERSION=7.2 \
    --build-arg XDEBUG_EXTENSION=xdebug-^3.1 \
    --build-arg XDEBUG_FILE=config/xdebug3.ini \
    --build-arg PHP_EXTENSIONS_ADD=mcrypt-stable \
    --build-arg PHPUNIT_VERSIONS=6,7,8 \
    .
```

```shell
docker build \
    --tag gander/dev:7.1 \
    --build-arg PHP_VERSION=7.1 \
    --build-arg XDEBUG_EXTENSION=xdebug-^2.9 \
    --build-arg XDEBUG_FILE=config/xdebug2.ini \
    --build-arg PHP_EXTENSIONS_ADD=mcrypt-stable \
    --build-arg PHPUNIT_VERSIONS=5,6,7 \
    .
```

```shell
docker build \
    --tag gander/dev:7.0 \
    --build-arg PHP_VERSION=7.0 \
    --build-arg XDEBUG_EXTENSION=xdebug-^2.7 \
    --build-arg XDEBUG_FILE=config/xdebug2.ini \
    --build-arg PHP_EXTENSIONS_ADD=mcrypt-stable \
    --build-arg PHPUNIT_VERSIONS=5,6 \
    --build-arg USE_ARCHIVE=1 \
    .
```

```shell
docker build \
    --tag gander/dev:5.6 \
    --build-arg PHP_VERSION=5.6 \
    --build-arg XDEBUG_EXTENSION=xdebug-^2.5 \
    --build-arg XDEBUG_FILE=config/xdebug2.ini \
    --build-arg PHP_EXTENSIONS_ADD=mcrypt-stable \
    --build-arg PHPUNIT_VERSIONS=4,5 \
    --build-arg USE_ARCHIVE=1 \
    .
```
