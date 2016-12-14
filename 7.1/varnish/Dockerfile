FROM louisbl/php:7.1-apache
MAINTAINER louisbl <louisbl@beltramo.me>

RUN apt-get update && apt-get install -y apt-transport-https
RUN curl https://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list \
  && apt-get update \
  && apt-get install -y varnish

EXPOSE 6081
