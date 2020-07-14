RELATIVE_DIR=$(dirname "$0")
cd "$RELATIVE_DIR"
SHELL_PATH=$(pwd -P)
cd "$SHELL_PATH"
./init.sh
./rebuild_docker.sh
./docker.sh
./run_time.sh
