RELATIVE_DIR=$(dirname "$0")
cd "$RELATIVE_DIR"
SHELL_PATH=$(pwd -P)
cd "$SHELL_PATH"
cd ../TRAVEL-DIARY-API-SERVER/project/src/project
composer install

if [ -f ".env" ];then
    echo "env file exist"
else
    echo "env file doesn't exist"
    cp .env.example .env
fi

chmod -R 777 storage/logs
php artisan key:generate