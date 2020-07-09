RELATIVE_DIR=$(dirname "$0")
cd "$RELATIVE_DIR"
SHELL_PATH=$(pwd -P)
cd "$SHELL_PATH"
is_docker_exist=$(which docker | wc -c)
if [ "$is_docker_exist" -gt 0 ];then
    echo "docker exist"
else
    echo "docker doesn't exist"
    yum install -y dockeryum install -y dockeryum install -y docker
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

chmod -R 777 ../config

host_ip=$(hostname -I)
host_ip=$(echo "$host_ip" | tr " " "\n" | head -1)
echo "$host_ip" > ../config/host_ip.txt

cd ../ && HOST_IP=${host_ip} docker-compose up -d
