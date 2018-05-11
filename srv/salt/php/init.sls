php-fpm:
  pkg.installed

php-mysql:
  pkg.installed

/etc/php/7.0/fpm/php.ini:
  file.managed:
    - source: salt://php/php.ini

/var/www/html/test.php:
  file.managed:
    - source: salt://php/test.php

phpservice:
  service.running:
    - name: php7.0-fpm
    - watch:
      - file: /etc/php/7.0/fpm/php.ini
