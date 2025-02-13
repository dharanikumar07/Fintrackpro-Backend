FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y libpq-dev zip unzip git curl

# Install extensions
RUN docker-php-ext-install pdo pdo_pgsql

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy application files
COPY . .

# Set permissions
RUN chown -R www-data:www-data /var/www

CMD ["php-fpm"]
