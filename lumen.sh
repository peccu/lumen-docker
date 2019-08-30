#!/bin/bash
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}"); pwd)
cd $SCRIPT_DIR
CURRENT_UID=$(id -u):$(id -g) docker-compose run --rm lumen "$@"
