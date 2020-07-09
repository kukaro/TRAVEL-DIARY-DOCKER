RELATIVE_DIR=$(dirname "$0")
cd "$RELATIVE_DIR"
SHELL_PATH=$(pwd -P)
cd "$SHELL_PATH"
cd ../TRAVEL-DIARY-API-SERVER/project/src/project

if [ -f ".env" ];then
    echo "env file exist"
    rm .env
else
    echo "env file doesn't exist"
fi
