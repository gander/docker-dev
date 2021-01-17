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

## Usage
+ Map volume `/code` (with `public` dir) to `/www/foobar.localhost`. Open [http://foobar.localhost/](http://foobar.localhost/).
+ Map volume `/code/index.php` to `/www/localhost/public/index.php`. Open [http://localhost/](http://localhost/).
+ [Examples](./examples/README.md)

## Xdebug
1. Add mapping in: _[File | Settings | Languages & Frameworks | PHP | Servers](jetbrains://PhpStorm/settings?name=Languages+%26+Frameworks--PHP--Servers)_
2. Install: [Browser debugging extensions](https://www.jetbrains.com/help/phpstorm/browser-debugging-extensions.html)
3. Run: [Debug a PHP HTTP request](https://www.jetbrains.com/help/phpstorm/debugging-a-php-http-request.html)
4. Run: [Debug a PHP CLI script](https://www.jetbrains.com/help/phpstorm/debugging-a-php-cli-script.html)

[Debug with PhpStorm: Ultimate Guide](https://www.jetbrains.com/help/phpstorm/debugging-with-phpstorm-ultimate-guide.html)

## Base (&bull;) and installed (&check;) modules:

|             | 8.0   | 7.4   | 7.3   | 7.2   | 7.1   | 7.0   | 5.6   |
|-------------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|amqp         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|apcu         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|ast          |&check;|&check;|&check;|&check;|&check;|&check;|&times;|
|bcmath       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|bz2          |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|ctype        |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|curl         |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|date         |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|dom          |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|ereg         |       |       |       |       |       |       |&bull; |
|exif         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|fileinfo     |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|filter       |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|ftp          |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|gd           |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|hash         |       |       |       |       |       |       |&bull; |
|iconv        |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|intl         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|json         |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|libxml       |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|mbstring     |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|mbstring     |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|mcrypt       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|memcached    |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|mhash        |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|mongodb      |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|mysqli       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|mysqlnd      |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|oauth        |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|opcache      |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|openssl      |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|pcntl        |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pcre         |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|PDO          |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|pdo_firebird |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_mysql    |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_odbc     |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_pgsql    |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|pdo_sqlite   |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|Phar         |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|posix        |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|readline     |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|redis        |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|Reflection   |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|session      |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|SimpleXML    |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|soap         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|sockets      |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|sodium       |&bull; |&bull; |&bull; |&bull; |&bull; |       |       |
|SPL          |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|sqlite3      |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|standard     |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|tidy         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|tokenizer    |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|uuid         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|xdebug       |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|xml          |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|xmlreader    |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|xmlwriter    |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
|xsl          |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|yaml         |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|zip          |&check;|&check;|&check;|&check;|&check;|&check;|&check;|
|zlib         |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |&bull; |
