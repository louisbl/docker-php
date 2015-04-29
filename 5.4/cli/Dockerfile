FROM php:5.4-cli
MAINTAINER louisbl <louis@beltramo.me>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    g++ \
    libbz2-dev \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libpq-dev \
    libreadline6-dev \
    libssl-dev \
    libxml2-dev \
    libzip-dev \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
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

RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html
WORKDIR /var/www/html
