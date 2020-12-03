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
