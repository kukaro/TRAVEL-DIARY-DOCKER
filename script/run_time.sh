RELATIVE_DIR=$(dirname "$0")
cd "$RELATIVE_DIR"
SHELL_PATH=$(pwd -P)
cd "$SHELL_PATH"

host_ip=$(hostname -I)
host_ip=$(echo "$host_ip" | tr " " "\n" | head -1)

source ~/.bashrc

cd ../TRAVEL-DIARY-API-SERVER/project/src/project
composer install

if [ -f ".env" ];then
    echo "API's env file exist"
else
    echo "API's env file doesn't exist"
    cp .env.example .env
    sed -ri "s/DB_HOST=127.0.0.1/DB_HOST=$host_ip/g" .env
    sed -ri "s/DB_DATABASE=laravel/DB_DATABSE=td_db/g" .env
    sed -ri "s/DB_PASSWORD=/DB_PASSWORD=root/g" .env
fi
chmod -R 777 . 
php artisan key:generate
php artisan jwt:secret

cd ../../../../TRAVEL-DIARY-VIEW-SERVER/project/src/project
composer install
npm install
npm run dev

if [ -f ".env" ];then
    echo "VIEW's env file exist"
else
    echo "VIEW's env file doesn't exist"
    cp .env.example .env
fi
chmod -R 777 . 
php artisan key:generate
