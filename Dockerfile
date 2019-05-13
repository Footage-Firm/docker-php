# https://hub.docker.com/_/php/
FROM php:7.3-alpine

RUN apk add --no-cache $PHPIZE_DEPS

#Sockets
RUN docker-php-ext-install sockets

# Xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# Imagick
RUN apk add --no-cache imagemagick-dev
RUN apk add --no-cache libtool
RUN pecl install imagick
RUN docker-php-ext-enable imagick

# MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Bcmath
RUN apk add --no-cache bzip2-dev \
    && docker-php-ext-install bz2 \
    && docker-php-ext-install bcmath

# Soap
RUN apk add --no-cache libxml2-dev \
    && docker-php-ext-install soap

# Kafka
RUN apk add librdkafka-dev \
    && pecl install rdkafka \
    && docker-php-ext-enable rdkafka
