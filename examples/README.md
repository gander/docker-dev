# Examples

## Example "docker run" configuration

```shell
docker run \
    --rm \
    --publish "8080:80" \
    --volume "${PWD}/app/xdebug3:/www/localhost" \
    --workdir "/www/localhost/public" \
    --name "dev_80" \
    --hostname "dev-80" \
    --add-host="host.docker.internal:host-gateway" \
    "gander/dev:8.0"
```

```shell
docker run \
    --rm \
    --publish "8056:80" \
    --volume "${PWD}/app/xdebug2:/www/localhost" \
    --workdir "/www/localhost/public" \
    --name "dev_56" \
    --hostname "dev-56" \
    --add-host="host.docker.internal:host-gateway" \
    "gander/dev:5.6"
```

## Example [docker-compose.yml](docker-compose.yml) configuration

```yaml
extra_hosts:
  - "host.docker.internal:host-gateway"
```
```shell
docker-compose up
```

## PhpStorm "Servers" Configuration

_[File | Settings | Languages & Frameworks | PHP | Servers](jetbrains://PhpStorm/settings?name=Languages+%26+Frameworks--PHP--Servers)_

|Name|Host|Port|Debugger|File/Directory|Absolute path on the server|
|:---:|:---:|:---:|:---:|:---:|:---:|
|`dev.56`|`localhost`|`8056`|_Xdebug_|`app/xdebug2`|`/www/localhost`|
|`dev.70`|`localhost`|`8070`|_Xdebug_|`app/xdebug2`|`/www/localhost`|
|`dev.71`|`localhost`|`8071`|_Xdebug_|`app/xdebug2`|`/www/localhost`|
|`dev.72`|`localhost`|`8072`|_Xdebug_|`app/xdebug3`|`/www/localhost`|
|`dev.73`|`localhost`|`8073`|_Xdebug_|`app/xdebug3`|`/www/localhost`|
|`dev.74`|`localhost`|`8074`|_Xdebug_|`app/xdebug3`|`/www/localhost`|
|`dev.80`|`localhost`|`8080`|_Xdebug_|`app/xdebug3`|`/www/localhost`|

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