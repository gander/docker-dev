# gander/dev
PHP, Apache, dev user (1000)

## Supported tags:
* `7.2`, `7`, `latest`
* `7.1`
* `7.0`
* `5.6`, `5`

### Run:
`docker run -d -p 80:80 -v "${HOME}/projects:/www" gander/dev`

#### Required directory structure:
+ `~/projects/example1.dev/public/`
+ `~/projects/example2.dev/public/`
+ `~/projects/example3.dev/public/`

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
    dev70:
        container_name: 'dev70'
        image: 'gander/dev:7.0'
        volumes:
            - '.:/www'
        ports:
            - '8070:80'
    dev71:
        container_name: 'dev71'
        image: 'gander/dev:7.1'
        volumes:
            - '.:/www'
        ports:
            - '8071:80'
    dev72:
        container_name: 'dev72'
        image: 'gander/dev:7.2'
        volumes:
            - '.:/www'
        ports:
            - '8072:80'
```

**When problem with DNS Resolv: [Wildcard DNS in your Ubuntu hosts file using dnsmasq][leaseweb]**

[leaseweb]: https://www.leaseweb.com/labs/2013/08/wildcard-dns-ubuntu-hosts-file-using-dnsmasq/

[dockerfile-5.6]: https://github.com/gander/docker-dev/blob/master/Dockerfile.56
[dockerfile-7.0]: https://github.com/gander/docker-dev/blob/master/Dockerfile.70
[dockerfile-7.1]: https://github.com/gander/docker-dev/blob/master/Dockerfile.71
[dockerfile-7.2]: https://github.com/gander/docker-dev/blob/master/Dockerfile.72
