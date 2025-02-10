#!/bin/bash

cd /var/www/html/laravel

# Laravel が書き込みを行うディレクトリの所有権/パーミッションを調整
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

# その後、マイグレーションやキャッシュ作成を実行
php artisan migrate --force
php artisan cache:clear
php artisan config:cache
php artisan route:cache

echo "Deployment steps completed."