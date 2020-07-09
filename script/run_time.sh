RELATIVE_DIR=`dirname "$0"`
cd $RELATIVE_DIR
SHELL_PATH=`pwd -P`
cd $SHELL_PATH
cd ../TRAVEL-DIARY-API-SERVER/project/src/project
composer install
