# gander/dev

PHP, Apache, dev user (1000)

## Supported tags:

* `8.0`, `8.1`, `8.2`
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
