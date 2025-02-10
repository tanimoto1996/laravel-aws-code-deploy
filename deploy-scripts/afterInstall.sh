#!/bin/bash

cd /var/www/html/laravel

# パーミッション調整テスト
chmod -R 775 storage
chmod -R 775 bootstrap/cache

# .env の本番差し替えなど必要ならここで対応
# cp /var/www/html/laravel/.env.production /var/www/html/laravel/.env

# マイグレーション
php artisan migrate --force

# キャッシュクリア & 再生成
php artisan cache:clear
php artisan config:cache
php artisan route:cache

echo "Deployment steps completed."
