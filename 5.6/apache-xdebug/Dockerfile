FROM ozconseil/php:5.6-apache
MAINTAINER ozconseil <team-dev@ozconseil.com>

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN pecl install xdebug-beta && docker-php-ext-enable xdebug
