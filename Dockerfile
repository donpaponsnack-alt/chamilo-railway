FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    unzip \
    wget \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    mariadb-client \
    && docker-php-ext-install mysqli pdo pdo_mysql zip

RUN a2enmod rewrite

WORKDIR /var/www/html

RUN wget https://github.com/chamilo/chamilo-lms/releases/download/v1.11.24/chamilo-1.11.24.zip \
 && unzip chamilo-1.11.24.zip \
 && mv chamilo-1.11.24/* . \
 && rm -rf chamilo-1.11.24 chamilo-1.11.24.zip

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
