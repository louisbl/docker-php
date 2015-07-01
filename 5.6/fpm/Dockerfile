FROM php:5.6-fpm
MAINTAINER ozconseil <team-dev@ozconseil.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    g++ \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libpq-dev \
    libzip-dev \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/include/freetype2/freetype && ln -s /usr/include/freetype2/freetype.h /usr/include/freetype2/freetype/freetype.h

RUN docker-php-ext-configure gd --with-jpeg-dir --with-freetype-dir --enable-gd-native-ttf \
    && docker-php-ext-install \
    bz2 \
    gd \
    intl \
    mbstring \
    mcrypt \
    mysqli \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    zip

COPY php-fpm.conf /usr/local/etc/php-fpm.conf

VOLUME ["/var/www"]
