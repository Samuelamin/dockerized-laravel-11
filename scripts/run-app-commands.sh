#!/bin/sh

# Ensure we're in the correct directory
cd /var/www/app

echo "Running commands in /var/www..."
php artisan migrate --force
php artisan db:seed --force
chown -R www-data:www-data /var/www/app
chmod -R 755 /var/www/app


npm install
npm run build
echo "All commands executed successfully!"
