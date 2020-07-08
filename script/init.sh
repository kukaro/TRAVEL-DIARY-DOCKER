is_docker_exist=`which docker | wc -c`
if [ $is_docker_exist -gt 0 ];then
    echo "docker exist"
else
    yum install -y dockeryum install -y dockeryum install -y docker
if
chmod -R 777 /var/run/docker.sock