# Invoker

## Run containers:
```shell
cd examples/invoker
docker-compose up -d
```

### Inspect:
```shell
docker-compose exec php_dev bash
docker-compose exec php_ssh bash
```


### Install laravel:
```shell
docker-compose exec php_dev /home/dev/.composer/vendor/bin/laravel new --force localhost
```

#### Check installation:
```shell
docker-compose exec php_dev php /www/localhost/artisan --version
```
Open: http://localhost/

#### Check connection:
```shell
ssh dev@localhost -p 2222 
# password: secret
```

### Configure Invoker:
| Field                       | Value                       |
|-----------------------------|-----------------------------|
| Host                        | `localhost` `2222`          |
| Username                    | `dev`                       |
| Project path                | `/www/localhost`            |
| Authentication Type         | _Password_                  |
| Password                    | `secret`                    |

***Enjoy!***

## Source:

[How to use Invoker with docker containers?](https://dev.to/insolita/how-to-use-invoker-with-docker-containers-59a3)
