# gander/php-apache-dev
PHP, Apache, dev user (1000)

## Supported tags:
* [`latest` (7.1/Dockerfile)][dockerfile-7.1]
* [`7.1` (7.1/Dockerfile)][dockerfile-7.1]
* [`7.0` (7.0/Dockerfile)][dockerfile-7.0]
* [`5.6` (5.6/Dockerfile)][dockerfile-5.6]

### Run:
`docker run -d -p 80:80 -v "${HOME}/projects:/www" gander/php-apache-dev`

#### Required directory structure:
+ `~/projects/example1.dev/public/`
+ `~/projects/example2.dev/public/`
+ `~/projects/example3.dev/public/`

**When problem with DNS Resolv: [Wildcard DNS in your Ubuntu hosts file using dnsmasq][leaseweb]**

[leaseweb]: https://www.leaseweb.com/labs/2013/08/wildcard-dns-ubuntu-hosts-file-using-dnsmasq/

[dockerfile-5.6]: https://github.com/gander/docker-php-apache-dev/blob/master/Dockerfile.56
[dockerfile-5.6-fpm]: https://github.com/gander/docker-php-apache-dev/blob/fpm/Dockerfile.56

[dockerfile-7.0]: https://github.com/gander/docker-php-apache-dev/blob/master/Dockerfile.70
[dockerfile-7.0-fpm]: https://github.com/gander/docker-php-apache-dev/blob/fpm/Dockerfile.70

[dockerfile-7.1]: https://github.com/gander/docker-php-apache-dev/blob/master/Dockerfile.71
[dockerfile-7.1-fpm]: https://github.com/gander/docker-php-apache-dev/blob/fpm/Dockerfile.71




```bash

alias lamp='_PWD=${PWD} && cd ${HOME}/.lamp && docker-compose up -d; cd ${_PWD}'
alias unlamp='_PWD=${PWD} && cd ${HOME}/.lamp && docker-compose down; cd ${_PWD}'
alias dev='docker exec -it lamp_dev_1 bash'
```
