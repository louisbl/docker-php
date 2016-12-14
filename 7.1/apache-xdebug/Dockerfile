FROM louisbl/php:7.1-apache
MAINTAINER louisbl <louisbl@beltramo.me>

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN pecl install xdebug && docker-php-ext-enable xdebug
