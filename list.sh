#! /usr/bin/bash

set -e

handle_error() {
    echo "There is an error on line $1"
}

trap 'handle_error $LINENO' ERR

screen -S server -X stuff "list\n"
sleep 3
screen -S server -X hardcopy /root/server_logs.txt

cat /root/server_logs.txt | tail