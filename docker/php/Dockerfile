FROM php:8.2-fpm

# Instalar extensiones necesarias
RUN docker-php-ext-install pdo pdo_mysql

# Instalar MongoDB (opcional)
RUN apt-get update && apt-get install -y \
    libmongoc-1.0-0 \
    libjemalloc2 \
    && rm -rf /var/lib/apt/lists/*

# Usar php.ini de producción como base
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini || true

# Instalar y habilitar MongoDB (opcional)
RUN pecl install mongodb && docker-php-ext-enable mongodb

WORKDIR /var/www/html

