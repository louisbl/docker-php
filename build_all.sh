#!/usr/bin/env bash

docker build -t louisbl/php:7.0-apache 7.0/apache
docker build -t louisbl/php:7.0-apache-xdebug 7.0/apache-xdebug
docker build -t louisbl/php:7.0-cli 7.0/cli
docker build -t louisbl/php:7.0-onbuild 7.0/onbuild
docker build -t louisbl/php:7.0-varnish 7.0/varnish
docker build -t louisbl/php:7.0-varnish-xdebug 7.0/varnish-xdebug

docker build -t louisbl/php:7.1-apache 7.1/apache
docker build -t louisbl/php:7.1-apache-xdebug 7.1/apache-xdebug
docker build -t louisbl/php:7.1-cli 7.1/cli
docker build -t louisbl/php:7.1-onbuild 7.1/onbuild
docker build -t louisbl/php:7.1-varnish 7.1/varnish
docker build -t louisbl/php:7.1-varnish-xdebug 7.1/varnish-xdebug
