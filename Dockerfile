# https://hub.docker.com/_/php/
FROM php:7.3-alpine

RUN apk update

RUN apk add --no-cache $PHPIZE_DEPS

# Git
RUN apk add git

#Sockets
RUN docker-php-ext-install sockets

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
RUN apk add librdkafka-dev=1.2.0-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    && pecl install rdkafka \
    && docker-php-ext-enable rdkafka

# Xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# Redis
RUN pecl install redis
RUN docker-php-ext-enable redis

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# PCNTL
RUN docker-php-ext-install pcntl
