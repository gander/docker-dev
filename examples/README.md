# Examples

## Example "docker run" configuration

```shell
docker run \
    --rm \
    --publish "80:80" \
    --workdir "/www/localhost/public" \
    --name "dev_simple_82" \
    --hostname "dev-82" \
    --add-host="host.docker.internal:host-gateway" \
    "gander/dev:8.2"
```

Open: [localhost](http://localhost/)

## SSL with [mkcert](https://mkcert.dev/)

```shell
mkcert -install
```

```shell
mkcert localhost
```

```shell
docker run \
    --rm \
    --publish "80:80" \
    --publish "443:443" \
    --volume "${PWD}/localhost.pem:/etc/ssl/certs/ssl-cert-snakeoil.pem:ro" \
    --volume "${PWD}/localhost-key.pem:/etc/ssl/private/ssl-cert-snakeoil.key:ro" \
    --workdir "/www/localhost/public" \
    --name "dev_ssl_82" \
    --hostname "dev-82" \
    --add-host="host.docker.internal:host-gateway" \
    "gander/dev:8.2"
```

+ Open: [localhost over HTTP](http://localhost/)
+ Open: [localhost over HTTPS](https://localhost/)

## Example [docker-compose.yml](docker-compose.yml) configuration

```shell
docker-compose up
```

## Xdebug port: _9003_ (v2 & v3)

_[File | Settings | PHP | Debug](jetbrains://PhpStorm/settings?name=PHP--Debug)_

## PhpStorm "Servers" Configuration

_[File | Settings | PHP | Servers](jetbrains://PhpStorm/settings?name=PHP--Servers)_

These settings refer to the configuration in the [docker-compose.yml](docker-compose.yml) file:

|   Name   |    Host     |  Port  | Debugger | File/Directory | Absolute path on the server |
|:--------:|:-----------:|:------:|:--------:|:--------------:|:---------------------------:|
| `dev.56` | `localhost` | `8056` | _Xdebug_ |   `examples`   |   `/www/localhost/public`   |
| `dev.70` | `localhost` | `8070` | _Xdebug_ |   `examples`   |   `/www/localhost/public`   |
| `dev.71` | `localhost` | `8071` | _Xdebug_ |   `examples`   |   `/www/localhost/public`   |
| `dev.72` | `localhost` | `8072` | _Xdebug_ |   `examples`   |   `/www/localhost/public`   |
| `dev.73` | `localhost` | `8073` | _Xdebug_ |   `examples`   |   `/www/localhost/public`   |
| `dev.74` | `localhost` | `8074` | _Xdebug_ |   `examples`   |   `/www/localhost/public`   |
| `dev.80` | `localhost` | `8080` | _Xdebug_ |   `examples`   |   `/www/localhost/public`   |
| `dev.81` | `localhost` | `8081` | _Xdebug_ |   `examples`   |   `/www/localhost/public`   |
| `dev.82` | `localhost` | `8082` | _Xdebug_ |   `examples`   |   `/www/localhost/public`   |

## Docker 20.10+

```yaml
extra_hosts:
  - "host.docker.internal:host-gateway"
```

## Docker < 20.10

```yaml
extra_hosts:
  - "host.docker.internal:${HOST_DOCKER_INTERNAL}"
```

```shell
HOST_DOCKER_INTERNAL=$(hostname -I | awk '{print $1}') docker-compose up
```

```shell
docker run --add-host="host.docker.internal:$(hostname -I | awk '{print $1}')"
```

## Xdebug CLI

```shell
export XDEBUG_SESSION=1
export XDEBUG_CONFIG=1
php script1.php
php script2.php
php script3.php
unset XDEBUG_SESSION
unset XDEBUG_CONFIG
```

or:

```shell
XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php script.php
```

or:

```shell
docker-compose exec dev56 bash -c 'XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php index.php'
docker-compose exec dev70 bash -c 'XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php index.php'
docker-compose exec dev71 bash -c 'XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php index.php'
docker-compose exec dev72 bash -c 'XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php index.php'
docker-compose exec dev73 bash -c 'XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php index.php'
docker-compose exec dev74 bash -c 'XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php index.php'
docker-compose exec dev80 bash -c 'XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php index.php'
docker-compose exec dev81 bash -c 'XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php index.php'
docker-compose exec dev82 bash -c 'XDEBUG_SESSION=1 XDEBUG_CONFIG=1 php index.php'
```

## Articles

+ [PhpStorm: Configure Xdebug](https://www.jetbrains.com/help/phpstorm/configuring-xdebug.html)
+ [Browser debugging extensions](https://www.jetbrains.com/help/phpstorm/browser-debugging-extensions.html)
