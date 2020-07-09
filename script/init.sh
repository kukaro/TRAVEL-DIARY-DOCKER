RELATIVE_DIR=$(dirname "$0")
cd "$RELATIVE_DIR"
SHELL_PATH=$(pwd -P)
cd "$SHELL_PATH"
is_docker_exist=$(which docker | wc -c)
if [ "$is_docker_exist" -gt 0 ];then
    echo "docker exist"
else
    echo "docker doesn't exist"
    yum install -y docker
fi
systemctl start docker.service
is_docker_compose_exist=$(which docker-compose | wc -c)
if [ "$is_docker_compose_exist" -gt 0 ];then
    echo "docker-compose exist"
else
    echo "docker-compose doesn't exist"
    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
fi
chmod -R 777 /usr/local/bin/docker-compose

if [ -d "../config" ];then
    echo "config exist"
else
    echo "config doesn't exist"
    mkdir ../config
fi

is_bzip2=$(which bzip2 | wc -c)
if [ "$is_bzip2" -gt 0 ];then
    echo "bzip2 exist"
else
    echo "bzip2 doesn't exist"
    yum install -y bzip2
fi

is_php=$(which php | wc -c)
if [ "$is_php" -gt 0 ];then
    echo "php exist"
else
    echo "php doesn't exist"
    yum install -y epel-release yum-utils
    yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    yum-config-manager --enable remi-php73
    yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd
    yum install -y php-mbstring
    yum install -y php-zip
    yum install -y php-xml
    composer global require laravel/installer
    ln -s /root/.composer/vendor/bin/laravel /usr/local/bin/laravel
fi

is_composer=$(which composer | wc -c)
if [ "$is_composer" -gt 0 ];then
    echo "composer exist"
else
    echo "composer doesn't exist"
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
fi

chmod -R 777 ../config
