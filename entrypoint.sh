#!/bin/bash
cd /var/www

composer install
if [ ! -f ".env" ]; then
cp .env.example .env
php artisan key:generate
else
echo "enviroment exist"
fi
npm i
npm run build
php artisan migrate --force
php artisan optimize:clear
exec php-fpm
