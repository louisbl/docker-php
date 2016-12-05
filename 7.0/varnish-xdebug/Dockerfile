FROM ozconseil/php:7.0-varnish
MAINTAINER ozconseil <team-dev@ozconseil.com>

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN pecl install xdebug && docker-php-ext-enable xdebug
