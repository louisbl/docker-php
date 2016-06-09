FROM php:5.4-apache
MAINTAINER ozconseil <team-dev@ozconseil.com>

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y \
    g++ \
    imagemagick \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libpq-dev \
    libxslt1-dev \
    libzip-dev \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/include/freetype2/freetype && ln -s /usr/include/freetype2/freetype.h /usr/include/freetype2/freetype/freetype.h

RUN docker-php-ext-configure gd --with-jpeg-dir --with-freetype-dir --enable-gd-native-ttf \
    && docker-php-ext-install \
    bz2 \
    gd \
    exif \
    intl \
    mbstring \
    mcrypt \
    mysqli \
    mysql \
    pdo_mysql \
    xsl \
    zip

RUN echo "date.timezone = \"Europe/Paris\"" > /usr/local/etc/php/conf.d/timezone.ini
