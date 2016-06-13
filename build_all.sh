#!/usr/bin/env bash

docker build -t ozconseil/php:5.4-apache 5.4/apache
docker build -t ozconseil/php:5.4-apache-xdebug 5.4/apache-xdebug
docker build -t ozconseil/php:5.4-cli 5.4/cli
docker build -t ozconseil/php:5.4-onbuild 5.4/onbuild

docker build -t ozconseil/php:5.5-apache 5.5/apache
docker build -t ozconseil/php:5.5-apache-xdebug 5.5/apache-xdebug
docker build -t ozconseil/php:5.5-cli 5.5/cli
docker build -t ozconseil/php:5.5-onbuild 5.5/onbuild

docker build -t ozconseil/php:5.6-apache 5.6/apache
docker build -t ozconseil/php:5.6-apache-xdebug 5.6/apache-xdebug
docker build -t ozconseil/php:5.6-cli 5.6/cli
docker build -t ozconseil/php:5.6-onbuild 5.6/onbuild
