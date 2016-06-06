FROM ozconseil/php:5.5-apache
MAINTAINER ozconseil <team-dev@ozconseil.com>

# Install Nodejs, Git, ssh & mysql clients
RUN cd /tmp && curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update && apt-get install -y \
   git \
   openssh-client \
   mysql-client \
   nodejs \
  && rm -rf /var/lib/apt/lists/*
RUN npm install npm -g

# Install Composer
RUN curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/local/bin --filename=composer \
  && mkdir -p /var/www/composer-cache \
  && chmod 777 /var/www/composer-cache \
  && composer config -g cache-dir /var/www/composer-cache

WORKDIR /var/www

# npm deps
ONBUILD COPY package.json /var/www/
ONBUILD RUN npm install --unsafe-perm

# Composer deps
ONBUILD COPY auth.json /var/www/
ONBUILD COPY composer.json /var/www/
ONBUILD COPY composer.lock /var/www/
ONBUILD RUN composer install --prefer-dist --no-progress --no-dev -o

# custom code
ONBUILD COPY . /var/www/
