FROM php:8.2-fpm

# Instalar extensiones de PHP necesarias (como PDO y MySQL)
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Instalar las dependencias necesarias para MongoDB
RUN apt-get update && apt-get install -y \
    libmongoc-1.0-0 \
    libjemalloc2 \
    && rm -rf /var/lib/apt/lists/*

# Configuración de PHP, initializar el archivo php.ini
# Copiar el archivo php.ini-development a php.ini
#RUN mv /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

# Instalar las extensiones de PHP necesarias
# RUN pecl install mongodb \
#    && docker-php-ext-enable mongodb

# Establecer la ruta de trabajo
WORKDIR /var/www/html

