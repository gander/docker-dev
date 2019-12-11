# gander/dev
PHP, Apache, dev user (1000)

## Supported tags:
* `7.4`, `7`, `latest`
* `7.3`
* `7.2`
* `7.1`
* `7.0`
* `5.6`, `5`

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
