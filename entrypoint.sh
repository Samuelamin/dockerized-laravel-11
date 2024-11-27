#!/bin/bash
cd /var/www

git config --global --add safe.directory /var/www

# Ensure proper permissions for Laravel directories
chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache
chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Install composer dependencies
composer install
if [ ! -f ".env" ]; then
    cp .env.example .env
    php artisan key:generate
else
    echo "Environment file exists"
fi

# Install NPM dependencies
npm i
npm run build

# Run migrations
php artisan migrate --force
php artisan optimize:clear

# Start PHP-FPM
exec php-fpm
