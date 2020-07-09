RELATIVE_DIR=$(dirname "$0")
cd "$RELATIVE_DIR"
SHELL_PATH=$(pwd -P)
cd "$SHELL_PATH"
./init.sh
./run_time.sh