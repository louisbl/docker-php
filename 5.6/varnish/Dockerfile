FROM php:5.6-fpm
MAINTAINER ozconseil <team-dev@ozconseil.com>

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
    libxml2-dev \
    libzip-dev \
    zlib1g-dev \
    mysql-client \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/include/freetype2/freetype && ln -s /usr/include/freetype2/freetype.h /usr/include/freetype2/freetype/freetype.h

RUN pecl install apcu-4.0.11 \
    && docker-php-ext-enable apcu

RUN docker-php-ext-configure gd --with-jpeg-dir --with-freetype-dir --enable-gd-native-ttf \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install \
    bz2 \
    gd \
    exif \
    intl \
    json \
    mbstring \
    mcrypt \
    xmlrpc \
    bcmath \
    opcache \
    pdo_mysql \
    mysqli \
    zip

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=0'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini
RUN echo "date.timezone = \"Europe/Paris\"" > /usr/local/etc/php/conf.d/timezone.ini

RUN apt-get update && apt-get install -y apache2-bin apache2.2-common --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV APACHE_CONFDIR /etc/apache2
ENV APACHE_ENVVARS $APACHE_CONFDIR/envvars

RUN set -ex \
	\
# generically convert lines like
#   export APACHE_RUN_USER=www-data
# into
#   : ${APACHE_RUN_USER:=www-data}
#   export APACHE_RUN_USER
# so that they can be overridden at runtime ("-e APACHE_RUN_USER=...")
	&& sed -ri 's/^export ([^=]+)=(.*)$/: ${\1:=\2}\nexport \1/' "$APACHE_ENVVARS" \
	\
# setup directories and permissions
	&& . "$APACHE_ENVVARS" \
	&& for dir in \
		"$APACHE_LOCK_DIR" \
		"$APACHE_RUN_DIR" \
		"$APACHE_LOG_DIR" \
		/var/www/html \
	; do \
		rm -rvf "$dir" \
		&& mkdir -p "$dir" \
		&& chown -R "$APACHE_RUN_USER:$APACHE_RUN_GROUP" "$dir"; \
	done

# logs should go to stdout / stderr
RUN set -ex \
	&& . "$APACHE_ENVVARS" \
	&& ln -sfT /dev/stderr "$APACHE_LOG_DIR/error.log" \
	&& ln -sfT /dev/stdout "$APACHE_LOG_DIR/access.log" \
	&& ln -sfT /dev/stdout "$APACHE_LOG_DIR/other_vhosts_access.log"

# PHP files should be handled by PHP, and should be preferred over any other file type
RUN { \
		echo '<FilesMatch \.php$>'; \
		echo '\tSetHandler "proxy:fcgi://127.0.0.1:9000"'; \
		echo '</FilesMatch>'; \
		echo; \
		echo 'DirectoryIndex disabled'; \
		echo 'DirectoryIndex index.php index.html'; \
		echo; \
		echo '<Directory /var/www/>'; \
		echo '\tOptions -Indexes'; \
		echo '\tAllowOverride All'; \
		echo '</Directory>'; \
	} | tee "$APACHE_CONFDIR/conf-available/docker-php.conf" \
&& a2enconf docker-php

RUN a2enmod proxy_fcgi

RUN apt-get update && apt-get install -y apt-transport-https
RUN curl https://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list \
  && apt-get update \
  && apt-get install -y varnish

COPY apache2-foreground /usr/local/bin/
WORKDIR /var/www/html
EXPOSE 80 6081
CMD ["apache2-foreground"]
