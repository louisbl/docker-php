FROM ozconseil/php:5.5-apache
MAINTAINER ozconseil <team-dev@ozconseil.com>

# Install Git, ssh & mysql clients
RUN apt-get update && apt-get install -y  --no-install-recommends git openssh-client mysql-client

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Nodejs
RUN cd /tmp && curl -sL https://deb.nodesource.com/setup_0.12 | bash - \
  && apt-get install -y nodejs

RUN chown -R www-data:www-data /var/www

ONBUILD COPY composer.json /var/www/
ONBUILD COPY composer.lock /var/www/

ONBUILD RUN cd /var/www && composer install --prefer-source --no-dev -o

ONBUILD COPY package.json /var/www/
ONBUILD RUN npm install

ONBUILD COPY . /var/www/
ONBUILD RUN chown -R www-data:www-data /var/www

ONBUILD RUN cd /var/www && composer run-script deploy
ONBUILD RUN cd /var/www && npm run deploy

ONBUILD RUN find /var/www -type d -exec chmod 755 {} \;
ONBUILD RUN find /var/www -type f -exec chmod 644 {} \;
