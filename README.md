# gander/dev
PHP, Apache, dev user (1000)

## Supported tags:
* `8.0`, `8.1`
* `7.0`, `7.1`, `7.2`, `7.3`,`7.4`
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


## Modules installed by default:

|          | 5.6   | 7.0   | 7.1   | 7.2   | 7.3   | 7.4   | 8.0   | 8.1   |
|----------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|ctype     |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|curl      |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|dom       |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|fileinfo  |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|filter    |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|ftp       |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|hash      |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|iconv     |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|json      |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|mbstring  |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|openssl   |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|pcre      |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|pdo       |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|pdo_sqlite|&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|phar      |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|posix     |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|readline  |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|session   |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|simplexml |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|sodium    |       |       |       |&bull; |&bull; |&bull; |&bull; |&bull; |
|sqlite3   |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|tokenizer |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|xml       |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|xmlreader |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|xmlwriter |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |

## Additionally installed modules:

|          | 5.6   | 7.0   | 7.1   | 7.2   | 7.3   | 7.4   | 8.0   | 8.1   |
|----------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|bcmath    |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|ds        |       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|exif      |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|gd        |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|intl      |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|mcrypt    |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pcntl     |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_mysql |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_pgsql |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|redis     |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|uuid      |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|xdebug    |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|xsl       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|zip       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|&check;|

