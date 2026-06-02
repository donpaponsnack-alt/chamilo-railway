FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    unzip \
    wget \
    git \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    mariadb-client \
    && docker-php-ext-install mysqli pdo pdo_mysql zip

RUN a2dismod mpm_event || true
RUN a2dismod mpm_worker || true
RUN a2enmod mpm_prefork
RUN a2enmod rewrite

WORKDIR /var/www/html

RUN git clone --depth 1 https://github.com/chamilo/chamilo-lms.git .

RUN chown -R www-data:www-data /var/www/html

CMD ["apache2-foreground"]
