FROM php:7.1-cli-alpine

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require "hirak/prestissimo"

WORKDIR /app

