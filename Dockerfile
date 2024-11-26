# Dockerfile
FROM php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
    npm \
    git \
    libpq-dev \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy application
COPY . .

# Set permissions
RUN chown -R www-data:www-data /var/www/app \
    && chmod -R 755 /var/www/app \
    && chmod -R 775 /var/www/app/storage /var/www/app/bootstrap/cache

    
# Expose port 9000
EXPOSE 9000

CMD ["php-fpm"]
