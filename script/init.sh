is_docker_exist=$(which docker | wc -c)
if [ "$is_docker_exist" -gt 0 ];then
    echo "docker exist"
el
    echo "docker don't exist"
    yum install -y dockeryum install -y dockeryum install -y docker
fi
chmod -R 777 /var/run/docker.sock