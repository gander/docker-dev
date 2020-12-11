# gander/dev
PHP, Apache, dev user (1000)

## Supported tags:
* `8.0`, `latest`
* `7.4`
* `7.3`
* `7.2`
* `7.1`
* `7.0`
* `5.6`

## Installed modules:

|             | 8.0   | 7.4   | 7.3   | 7.2   | 7.1   | 7.0   | 5.6   |
|-------------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|apcu         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|ast          |&check;|&check;|&check;|&check;|&check;|&check;|       |
|bcmath       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|exif         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|gd           |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|intl         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|mbstring     |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|mcrypt       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|memcached    |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|mongodb      |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|mysqli       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|opcache      |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pcntl        |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_firebird |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_mysql    |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_odbc     |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_pgsql    |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|redis        |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|soap         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|sockets      |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|tidy         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|uuid         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|xdebug       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|xsl          |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|yaml         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|zip          |&check;|&check;|&check;|&check;|&check;|&check;|&check;|

### Run:
`docker run -d -p 80:80 -v "${HOME}/projects:/www" gander/dev`

#### Required directory structure:
+ `~/projects/example1.localhost/public/`
+ `~/projects/example2.localhost/public/`
+ `~/projects/example3.localhost/public/`

`docker-compose.yml`:
```yaml
version: '3'

services:
    dev56:
        container_name: 'dev56'
        image: 'gander/dev:5.6'
        volumes:
            - '.:/www'
        ports:
            - '8056:80'
    dev74:
        container_name: 'dev74'
        image: 'gander/dev:7.4'
        volumes:
            - '.:/www'
        ports:
            - '8074:80'
    dev80:
        container_name: 'dev80'
        image: 'gander/dev:8.0'
        volumes:
            - '.:/www'
        ports:
            - '8080:80'
```
