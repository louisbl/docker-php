FROM ozconseil/php:5.6-apache
MAINTAINER ozconseil <team-dev@ozconseil.com>

# Install Git, ssh & mysql clients
RUN apt-get update \
  && apt-get install -y --no-install-recommends git openssh-client mysql-client

# Install Composer
RUN curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/local/bin --filename=composer
RUN mkdir /var/www/composer-cache \
  && composer config -g cache-dir /var/www/composer-cache

# Install Nodejs
RUN cd /tmp && curl -sL https://deb.nodesource.com/setup_0.12 | bash - \
  && apt-get install -y nodejs

# Use www-data user to install deps
RUN chown -R www-data:www-data /var/www

# Composer deps
ONBUILD USER www-data
ONBUILD COPY auth.json /var/www/
ONBUILD COPY composer.json /var/www/
ONBUILD COPY composer.lock /var/www/
ONBUILD RUN cd /var/www && composer install --no-dev -o

# npm deps
ONBUILD COPY package.json /var/www/
ONBUILD RUN npm install

# custom code
ONBUILD COPY . /var/www/

# Back to the roots
ONBUILD USER root
ONBUILD RUN chown -R www-data /var/www
ONBUILD RUN find /var/www -type d -exec chmod 755 {} \;
ONBUILD RUN find /var/www -type f -exec chmod 644 {} \;
