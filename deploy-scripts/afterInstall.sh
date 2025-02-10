#!/bin/bash

cd /var/www/html/laravel

# --- (1) パーミッション調整 ---
# ※例: Nginx/PHP-FPMユーザーがwww-dataの場合
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

# --- (2) ビルド時のキャッシュファイルを削除 ---
rm -f bootstrap/cache/*.php

# --- (3) キャッシュクリア & 再生成 (本番EC2用のパスで上書き) ---
php artisan config:clear
php artisan cache:clear
php artisan config:cache
php artisan route:cache

# --- (4) DBマイグレーション (必要なら) ---
php artisan migrate --force

echo "Deployment steps completed."
