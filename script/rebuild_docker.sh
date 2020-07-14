RELATIVE_DIR=$(dirname "$0")
cd "$RELATIVE_DIR"
SHELL_PATH=$(pwd -P)
cd "$SHELL_PATH"

host_ip=$(hostname -I)
host_ip=$(echo "$host_ip" | tr " " "\n" | head -1)
echo "$host_ip" > ../config/host_ip.txt

cd ../ && HOST_IP=${host_ip} docker-compose build