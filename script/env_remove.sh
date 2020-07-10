RELATIVE_DIR=$(dirname "$0")
cd "$RELATIVE_DIR"
SHELL_PATH=$(pwd -P)
cd "$SHELL_PATH"
cd ../TRAVEL-DIARY-API-SERVER/project/src/project

if [ -f ".env" ];then
    echo "API's env file exist"
    rm .env
else
    echo "API's env file doesn't exist"
fi


cd ../../../../TRAVEL-DIARY-VIEW-SERVER/project/src/project

if [ -f ".env" ];then
    echo "VIEW's env file exist"
    rm .env
else
    echo "VIEW's env file doesn't exist"
fi
